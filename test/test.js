var TestSuite = artifacts.require("./Test.sol");

contract("Test", function(accounts) {
  it("should allow for the creation of a person", function(){
    return TestSuite.deployed().then(function(instance){
      var myBlok = instance;
      myBlok.newPerson("Stack", "Stackhouse").then(function(){
        assert.equal(myBlok.returnPerson(0), ["Stack", "Stackhouse"], "Wrong name") ;
      })
    })
  })
})
