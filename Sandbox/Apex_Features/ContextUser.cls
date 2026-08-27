/*
Implement the method getContextUserInformation(), which returns a Map of the current logged in user's (context user's)
 UserName, ProfileId, EmailId, and Type as keys and their field values as corresponding values in the map. 
*/

public Map<String,String> getContextUserInformation(){

    Map<String, String> mapa = new Map<String, String>();

    mapa.put('EmailId', UserInfo.getUserEmail());
    mapa.put('ProfileId', UserInfo.getProfileId());
    mapa.put('Type', UserInfo.getUserType());
    mapa.put('UserName', UserInfo.getUserName());


    return mapa;
}