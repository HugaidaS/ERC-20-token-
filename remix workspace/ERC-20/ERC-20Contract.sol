// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./ERC-20Interface.sol";

contract MyTokenContract is IERC20{

    string _name;
    string _symbol;
    uint8 _decimals;
    uint _totalSupply;

    mapping(address => uint256) _balances;
    mapping(address => mapping (address => uint256)) _allowances;

    constructor(uint amount){
    _name = "Nerd Girl Token";
    _symbol = "NTG";
    _decimals = 18;
    _totalSupply = amount;
     _balances[msg.sender] = amount;
     
    }

    function name() external view virtual override returns (string memory) {
        return _name;
    }
    function symbol() external view virtual override returns (string memory) {
        return _symbol;
    }
    function decimals() external view virtual override returns (uint8) {
        return _decimals;
    }

    function totalSupply() external view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) external view virtual override returns (uint balance) {
        return _balances[tokenOwner];
    }

    function transfer(address to, uint tokens) external virtual override returns (bool success) {
        require(tokens <= _balances[msg.sender]);
        _balances[msg.sender] = _balances[msg.sender] - tokens;
        _balances[to] = _balances[to] + tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function transferFrom(address from, address to, uint tokens) external virtual override returns (bool success) {
        require(tokens <= _balances[from]);
        _balances[from] = _balances[from] - tokens;
        _allowances[from][msg.sender] = _allowances[from][msg.sender] - tokens;
        _balances[to] = _balances[to] + tokens;
        emit Transfer(from, to, tokens);
        return true;
    }

    function approve(address spender, uint tokens) external virtual override returns (bool success) {
        _allowances[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }
}

