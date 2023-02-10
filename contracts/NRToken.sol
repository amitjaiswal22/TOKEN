// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract AmiToken is ERC20,Ownable{

    //constructor is intialize the SC
    constructor() ERC20("Amit","NR"){
        //mint is used to create new token
        //address(0)==msg.sender
        _mint(msg.sender,1000000*(10**uint(decimals())));
    }
    function mint (address account,uint256 amount) public onlyOwner returns(bool){
        require(account!=address(0) && amount!=uint256(0),"NR:FUNCTION MINT INVALID INPUT");
        _mint(account,amount);
        return true;

    }
    //Remove or Burn Token
    function burn(address account ,uint256 amount) public onlyOwner returns(bool){
        require(account!=address(this)&& amount!=uint256(0),"NR:FUNCTION BURN INVALID INPUT");
        _burn(account,amount);
        //return true;
    }
    function buy() public payable returns(bool){
    require(msg.sender.balance>=msg.value && msg.value!=0 ether,"NR :FUNCTION BUY INVALID INPUT");
    uint amount=msg.value*1000;
    _transfer(owner(),_msgSender(),amount);

 }
 function withdrraw(uint256 amount) public onlyOwner returns(bool){
     require(amount<=address(this).balance,"NR:FUNCTION WITHDRAW HAS INVALID INPUT");
     _transfer(owner(),_msgSender(),amount);
     return true;
 }
}