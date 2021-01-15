public with sharing class ControlPanelController {

    
    public ControlPanelController() {
       
    }

    @AuraEnabled(cacheable=true)
    public static String getAllCommunityInfo() {

        return APIInterface.submit(getCommunityEndpoint());
    }

    @AuraEnabled(cacheable=true)
    public static List<Network> getAllCommunities(){
        try {
            system.debug('In the Apex action');
            List<Network> clist = [Select ID, Name, Status from Network];
            system.debug(clist);
            return clist;        
        } catch (Exception e) {
            system.debug(e.getMessage());
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static String getSpecificCommunityInfo(String CommunityID) {

        String communityDetailsEndpoint = getCommunityEndpoint() + '/' + CommunityID;

        return APIInterface.submit(communityDetailsEndpoint);
    }

    @AuraEnabled(cacheable=true)
    public static String publishCommunity(String CommunityID) {

        String communityDetailsEndpoint = getCommunityEndpoint() + '/' + CommunityID + '/publish';

        return APIInterface.submit(communityDetailsEndpoint, 'POST');
    }

    @AuraEnabled(cacheable=true)
    public static String activateCommunity(String CommunityID) {
 
        string CommunityPublishEndpoint = getNetworkUpdateEndpoint() + CommunityID;
        return APIInterface.submit(CommunityPublishEndpoint, 'PATCH', '{"status":"Live"}');
    }

    private static String getBaseEndpoint() {
        return '/services/data/v50.0/';
    }

    private static String getCommunityEndpoint() {
        return getBaseEndpoint() + 'connect/communities';
    }

    private static String getNetworkUpdateEndpoint() {
        return getbaseEndpoint() + 'sobjects/Network/';
    }
    

}
