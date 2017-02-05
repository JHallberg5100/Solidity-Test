pragma solidity ^0.4.4;
contract Test{
  address owner;
  uint numPersons;

  mapping (uint => Person) Clients;
  struct CreditCard {
    string bankName;
    uint cardNum;
    uint securityNum;
    uint expDate;
  }


  struct LoginInformation{
    string websiteName;
    string username;
    string password;
  }

  struct Person{
    address clientAddress;
    string firstName;
    string lastName;
    uint numLogins;
    uint numCreditCards;

    mapping ( uint => LoginInformation) Logins;

    mapping (uint => CreditCard) Cards;
  }

  function Test(){
    owner = msg.sender;
    numPersons = 0;
  }

  function newPerson(string fn, string ln) returns (uint personId) {
      personId = numPersons++;
      Clients[personId] = Person(msg.sender,fn,ln,0,0);
  }

  function newCard(string bankName, uint cardNum, uint securityNum, uint expDate, uint PersonId) returns (uint cardId){
    Person p = Clients[PersonId];
    p.numCreditCards += 1;
    cardId = p.numCreditCards;
    p.Cards[cardId] = CreditCard(bankName,cardNum,securityNum,expDate);
  }

  function newLogin(string name, string u_name, string pass, uint PersonId) returns (uint loginId){
    Person p = Clients[PersonId];
    p.numLogins += 1;
    loginId = p.numLogins;
    p.Logins[loginId] = LoginInformation(name,u_name,pass);
  }

  function returnPerson(uint personId) constant returns (string firstName, string lastName){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      firstName = p.firstName;
      lastName = p.lastName;
    }
    else{
      firstName = "No";
      lastName = "No";
    }
  }

  function returnCard(uint personId, uint cardId) constant returns (string bankName, uint cardNum, uint securityNum, uint expDate){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      CreditCard c = p.Cards[cardId];
      bankName = c.bankName;
      cardNum = c.cardNum;
      securityNum = c.securityNum;
      expDate = c.expDate;
    }
    else {
      bankName = "Invalid";
      cardNum = 0;
      securityNum = 0;
      expDate = 0;
    }
  }
  function returnLogin(uint personId,uint loginId) constant returns (string websiteName, string username, string password){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      LoginInformation i = p.Logins[loginId];
      websiteName = i.websiteName;
      username = i.username;
      password = i.password;
    }
    else{
      websiteName = "Invalid";
      username = "Invalid";
      password = "Invalid";
    }
  }

  function returnCardNumber(uint personId) constant returns (uint totalCards){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      totalCards = p.numCreditCards;
    }
    else{
      totalCards = 0;
    }
  }

  function returnCardName(uint personId, uint cardNum) constant returns (string bankName){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      CreditCard c = p.Cards[cardNum];
      bankName = c.bankName;
    }
    else{
      bankName = "Invalid query";
    }
  }

  function returnLoginNumber(uint personId) constant returns (uint totalLogins){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      totalLogins = p.numLogins;
    }
    else{
      totalLogins = 0;
    }
  }

  function returnLoginName(uint personId, uint LoginNum) constant returns (string siteName){
    Person p = Clients[personId];
    if (p.clientAddress == msg.sender || owner == msg.sender){
      LoginInformation c = p.Logins[LoginNum];
      siteName = c.websiteName;
    }
    else{
      siteName = "Invalid query";
    }
  }
}
