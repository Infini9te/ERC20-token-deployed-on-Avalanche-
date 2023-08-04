// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DegenToken_FREE {
    string public name = "UniqueDegen";
    string public symbol = "UDGN";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    address public owner;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);
    event Redeem(address indexed from, string item, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[owner] = totalSupply;
    }

    function mintTokens(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        require(totalSupply + amount >= totalSupply, "Total supply overflow");

        balanceOf[to] += amount;
        totalSupply += amount;
        emit Mint(to, amount);
        emit Transfer(address(0), to, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function approveTokens(address spender, uint256 amount) public {
        require(spender != address(0), "Invalid address");

        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }

    function transferFromTokens(address from, address to, uint256 amount) public {
        require(from != address(0), "Invalid address");
        require(to != address(0), "Invalid address");
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf[from] >= amount, "Insufficient balance");
        require(allowance[from][msg.sender] >= amount, "Allowance exceeded");

        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        allowance[from][msg.sender] -= amount;
        emit Transfer(from, to, amount);
    }

    function burnTokens(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Burn(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }

    mapping(string => uint256) public itemPrices;

    function addItem(string memory itemName, uint256 price) public onlyOwner {
        require(price > 0, "Price must be greater than zero");
        itemPrices[itemName] = price;
    }

    function redeemTokens(string memory itemName) public {
        uint256 itemPrice = itemPrices[itemName];
        require(itemPrice > 0, "Invalid item");
        require(balanceOf[msg.sender] >= itemPrice, "Insufficient balance");

        balanceOf[msg.sender] -= itemPrice;
        emit Redeem(msg.sender, itemName, itemPrice);
    }
}
