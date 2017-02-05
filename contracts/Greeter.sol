pragma solidity ^0.4.4;
contract mortal {
  address owner;

  function mortal() {owner = msg.sender;}

  function kill() {if (msg.sender == owner) selfdestruct(owner);}


}

contract Greeter is mortal {
  string greeting;

  function Greeter(string _greeting) public {
    greeting = _greeting;
  }

  function greet() constant returns (string) {
    return greeting;
  }
}
