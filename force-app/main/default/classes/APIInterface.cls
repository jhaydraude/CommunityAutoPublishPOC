public with sharing class APIInterface {

    

    public static void submit(String endPoint, String method) {
        system.debug('Hitting Rest API');
        string theurl=getBaseURL() + endPoint;
        system.debug(theurl);
        HTTPRequest req = new HTTPRequest();
       // req.setEndpoint(getBaseURL() + 'query?q=' + EncodingUtil.urlEncode(queryString, 'UTF-8'));
        req.setEndpoint(theurl);
        req.setMethod(method);
        req.setHeader('Authorization', 'Bearer ' + getSessionId());
        UserInfo.getSessionId();
        req.setHeader('Content-Type', 'application/json');
        Http h = new Http();
        HttpResponse res = h.send(req);
        system.debug('Result:' + res.getStatus());
        system.debug(res.getBody());

    }

    private static string getSessionId() {
        if(Test.isRunningTest()) {
            return 'aaaaaaaaaaaaaaaaaaaa';
        }
        Pagereference sidPage = Page.SessionCreator;
        Map<String,Object> sidJSON = (Map<String,Object>)JSON.deserializeUntyped(sidPage.getContent().toString());
        String sessionID = (String)sidJSON.get('sessionId');
        return sessionID;
    }

    private static string getBaseURL() {
        String baseURL = URL.getSalesforceBaseUrl().toExternalForm();
        return baseURL;
    }
    
}
