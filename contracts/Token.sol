// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Token {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    uint256 _wei;
    address payable public owner;

    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        uint256 _initialSupply
    ) {
        name = _name;
        symbol = _symbol;
        decimals = 18;
        _wei = 1000000000000000000;
        totalSupply = _initialSupply * _wei;

        owner = payable(msg.sender);

        balanceOf[owner] = totalSupply;

        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function mint(uint256 _amount) public returns (bool success) {
        require(msg.sender == owner, "Operation unauthorised");

        totalSupply += _amount * _wei;
        balanceOf[msg.sender] += _amount * _wei;

        emit Transfer(address(0), msg.sender, _amount * _wei);
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        require(msg.sender != address(0), "Invalid burn recipient");
        require(totalSupply > _amount, "Burn amount exceeds balance");

        totalSupply -= _amount * _wei;
        balanceOf[msg.sender] -= _amount * _wei;

        emit Transfer(msg.sender, address(0), _amount * _wei);
        return true;
    }
}
