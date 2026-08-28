/*
Some Salesforce orgs (Trailhead playground orgs, for example) 
are given random names that include a combination of an adjective and an animal as a prefix. 
For instance, cunning-impala, curious-raccoon, and brave-hawk are possible prefixes for names for such orgs.
*/

public List<String> orgNames(List<String> adjectives, List<String> animals) {
    List<String> names = new List<String>();

    for(String i: animals){
        for(String j: adjectives){
            String name = j + '-' + i;
            names.add(name);
        }
    }

    return names;
}