pragma solidity ^0.4.8;

//*********************************************************************
//* @title AdsRegistry
//* @dev  
//* @author Gregoire JEANMART <gregoire.jeanmart at gmail.com> 
//*********************************************************************
contract AdsRegistry {

    //***********************
    //* Structure and enums     
    //*
    struct Ads {
        uint    id;
        address teacherAddress;
        bytes32 title;
        bytes32 description;
        bytes32 discipline;
        uint    dateCreated;
        bool    active;
    }
    //***********************/

    //***********************
    //* Data                
    //*
     
    // Constant

    // Variables  
    mapping(uint => Ads)    adsRegistery;
    uint public             nbAds;

    //***********************/
    
    
    //***********************
    //* Modifier    
    //*
    //modifier isActive {
    //    if(endDate > now && ended == false) {
    //        _;
    //    }
    //}
    //***********************
    
    
    //***********************
    //* Events      
    //*
    event AdsPublished(uint id, address teacherAddress, bytes32 title, bytes32 description);

    //***********************/
    
    
    //***********************
    //* AdsRegistry    
    //*
    function InsuranceHub() {
        nbAds = 0;
    }
    //***********************/

    
    //***********************
    //* Getter   
    //*
    function getAds() constant returns (uint[] _id, address[] _teacherAddress, bytes32[] _title, bytes32[] _description, bytes32[] _discipline, uint[] _dateCreated) {
    
        uint[]      memory adsIDArray              = new uint[](nbAds);
        address[]   memory adsTeacherAddressArray  = new address[](nbAds);
        bytes32[]   memory adsTitleArray           = new bytes32[](nbAds);
        bytes32[]   memory adsDescArray            = new bytes32[](nbAds);
        bytes32[]   memory adsDesciplineArray      = new bytes32[](nbAds);
        uint[]      memory adsDateCreatedArray     = new uint[](nbAds);

        uint index = 0;
        for (var i = 0; i < nbAds ; i++) {
            Ads memory ads = adsRegistery[i];
        
            if(ads.active == true) {
                adsIDArray[index]               = ads.id;
                adsTeacherAddressArray[index]   = ads.teacherAddress;
                adsTitleArray[index]            = ads.title;
                adsDescArray[index]             = ads.description;
                adsDesciplineArray[index]       = ads.discipline;
                adsDateCreatedArray[index]      = ads.dateCreated;
                index++;
            }
        }
        
        return (adsIDArray, adsTeacherAddressArray, adsTitleArray, adsDescArray, adsDesciplineArray, adsDateCreatedArray); 
    }
    //***********************/
    
    
    //***********************
    //* Public functions    
    //*
    function publishAds(address _teacherAddress, bytes32 _title, bytes32 _description, bytes32 _discipline) {
        
        // Register the ads
        Ads memory ads; 
        ads.id              = nbAds;
        ads.teacherAddress  = _teacherAddress;
        ads.title           = _title;
        ads.description     = _description;
        ads.discipline     = _discipline;
        ads.active          = true;
        ads.dateCreated     = now;
        
        adsRegistery[nbAds] = ads;
        
        
        // Increment ID counter
        nbAds += 1;
        
        
        // Trigger event
        AdsPublished(ads.id, ads.teacherAddress, ads.title, ads.description);
    }
  
    //***********************/
     
     
     
    //***********************
    //* Private functions       
    //*
    
    //***********************/
    

}
