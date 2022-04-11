// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./Stakeable.sol";

contract Token is Stakeable {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    uint256 _wei; // 1 Ether = 1000000000000000000 Wei
    address payable public owner;

    mapping(address => uint256) public balanceOf;

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

    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), "Invalid burn recipient");
        require(_account == owner, "Operation unauthorised");

        totalSupply += (_amount * _wei);
        balanceOf[_account] += (_amount * _wei);

        emit Transfer(address(0), _account, _amount * _wei);
    }

    function _burn(address _account, uint256 _amount) internal {
        require(_account != address(0), "Invalid burn recipient");
        require(_account == owner, "Operation unauthorised");
        require(totalSupply > _amount * _wei, "Burn amount exceeds balance");

        totalSupply -= (_amount * _wei);
        balanceOf[_account] -= (_amount * _wei);

        emit Transfer(_account, address(0), _amount * _wei);
    }

    function burn(address _account, uint256 _amount) public returns (bool) {
        _burn(_account, _amount);
        return true;
    }

    function mint(address _account, uint256 _amount) public returns (bool) {
        _mint(_account, _amount);
        return true;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        require(_to != address(0), "Receiver address invalid");
        require(_value >= 0, "Value must be greater or equal to 0");
        require(balanceOf[msg.sender] > _value, "Not enough balance");

        balanceOf[msg.sender] -= (_value);
        balanceOf[_to] += (_value);

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function stake(uint256 _amount) public {
        require(
            _amount < balanceOf[msg.sender],
            "DevToken: Cannot stake more than you own"
        );

        _stake(_amount);

        _burn(msg.sender, _amount);
    }
}
