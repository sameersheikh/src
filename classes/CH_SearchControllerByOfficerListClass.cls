public with sharing class CH_SearchControllerByOfficerListClass {
    
    public String resultDisplay {get;set;}  
    public String CH_searchTextNumber{get;set;}
    public String results{get;set;}
    
    public List<CompaniesHouse.OfficerDetails> itemsToDisplay {get;set;}
    public CompaniesHouse.OfficerList itemsToDisplayTopLevel {get;set;}
    public CompaniesHouse.Links itemsToDisplayLinks {get; set;}
    public List<CompaniesHouse.OfficerDetails> itemsToDisplayAddress {get;set;}
    
    
    //Officers List API
    public PageReference CH_Search_functionByOfficerList(){
        
        CompaniesHouseCalloutsRequest req = new CompaniesHouseCalloutsRequest();
        CompaniesHouseCalloutsResponse res = new CompaniesHouseCalloutsResponse();
        CompaniesHouse.OfficerList jsonData = new CompaniesHouse.OfficerList ();
        
        resultDisplay = req.getRequestOfficersList(CH_searchTextNumber);
        jsonData = res.getResponseOfficerList(resultDisplay);
        system.debug('JsonData before IF : ' + jsonData);
        system.debug('JsonData Total Results before IF : ' + jsonData.total_results);
        If(jsonData.total_results == null){
            
            results = 'No records found';
            
            
        }else{
            
            results = 'Record(s) found';
            
            itemsToDisplay = jsonData.items;
            itemsToDisplayTopLevel = jsonData;
            itemsToDisplayAddress  = jsonData.items;
            itemsToDisplayLinks = jsonData.links;
            
        }
        
        
        
        
        return null; 
    } 
    
}