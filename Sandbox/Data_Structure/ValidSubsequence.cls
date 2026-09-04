public Boolean isSubSequence(String s1, String s2){
    List<String> s1List = s1.split('');
    List<String> s2List = s2.split('');
    Map<String, Integer> charToIndex = new Map<String, Integer>();

    for (Integer i = 0; i < s1List.size(); i++) {

        for (Integer j = 0; j < s2List.size(); j++) {
            
            if (s1List[i] == s2List[j]) {
                charToIndex.put(s1List[i], j);
                if (i > 0 && charToIndex.get(s1List[i]) < charToIndex.get(s1List[i - 1])) {
                    return false;
                }
                break;
            }
        }
        if (charToIndex.get(s1List[i]) == null) {
            return false;
        }
    }
    return true;
}