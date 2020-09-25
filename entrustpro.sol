pragma solidity >0.4.0 <= 0.7.0;
//pragma solidity ^0.4.18;

//import "./ERC20.sol";
//import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "token1.sol";

contract entrustPro {
    
    
    //onboarding using google, facebook account and import data from linkedin
    struct onboard
    {
        string email; //provide your gmail, facebook etc
        string linkedinurl; //paste your existing linkedin_url and this will inport your profile
    }
    
    //add or modify your profile
    struct myprofile 
    {
        string myskills;
        string edqual;
        string workexperience;
    }
    
    
    
   // string public registering;
    //string public skills;
    //string public edqual;
    //string public endorsement;
    //int public incentives;
    

//create a struct profile and use the array- mappinging bet address and a structure

//A mapping is created , which accepts first the key type and the value will be as defined in our struct "registering"
//the mapping is referred as newregistration

mapping (address => onboard) public onboarding;
mapping (address => myprofile) public mappingprofile;
address [] public getonboard;
address [] public setprofile;



   function registerme(address _address, string memory _email, string memory _linkedinurl) public{
       //entrustPro.onboard storage registeringmyaccount = onboarding[_address];
       onboard storage registeringmyaccount = onboarding[_address];
       registeringmyaccount.email = _email;
       registeringmyaccount.linkedinurl = _linkedinurl;
       getonboard.push(_address);
      }
   
  function getRegisteredAccountInfo() view public returns (address[]) {
        return getonboard;
  }
  
 function settingprofile (address _address, string memory _myskills,string memory _edqual, string memory _workexperience) public{
   myprofile storage setupmyprofile = mappingprofile[_address];
   setupmyprofile.myskills = _myskills;
   setupmyprofile.edqual = _edqual;
   setupmyprofile.workexperience = _workexperience;
   setprofile.push(_address);
  }
  
  function getprofile() view public returns (address[]) {
      return setprofile;
  }
  
  //mint tokens
 
 /* constructor(uint256 initialSupply) public ERC20("entrustToken") {
        _mint(msg.sender, initialSupply);
   }
   entrustToken.bala */
  
  struct validator
    {
     string JobRoleValidation;
     string CertificationValidation;
     string PersonalInfoValidation;
    }
  
  enum ValidationType {
        JobRoleValidation,CertificationValidation,PersonalInfoValidation       
    }
    
    function registerAsValidator() external{ // should transfer tokens from his account to the LinkedIn account
        Token token= Token(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        token.transfer(msg.sender, 100);
        
    }

    
    
}