pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Test.sol";


contract TestTest{

  function beforeAll(){
    Test myBlok = Test(DeployedAddresses.Test());

    myBlok.newPerson("Stack","Stackhouse");
    myBlok.newCard("Chase",1234123412341234,123,1212,0);
    myBlok.newLogin("Reddit.com","ThePrez","Du23Du23",0);
  }


  function testReturnPerson(){
    Test myBlok = Test(DeployedAddresses.Test());

    myBlok.newPerson("Stack","Stackhouse");
    Assert.equal(myBlok.returnPerson(0), ["Stack", "Stackhouse"]);
  }

}
