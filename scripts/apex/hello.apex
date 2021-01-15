// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

String baseEndpoint='/services/data/v50.0/connect/communities';
String method = 'GET';

APIInterface.submit(baseEndpoint, method);

String CID = '0DB3B0000004u0TWAQ';

String communityDetailsEndpoint = baseEndpoint + '/' + CID;

APIInterface.submit(communityDetailsEndpoint, method);

String  publishCommunityEndpoint = communityDetailsEndpoint + '/publish';

method = 'POST';

APIInterface.submit(publishCommunityEndpoint,method);
