public boolean isAnagram(String s1, String s2) {
    if(s1 != null && s2 != null){
        Integer [] s1Chars = s1.getChars();
        Integer [] s2Chars = s2.getChars();

        s1Chars.sort();
        s2Chars.sort();

        if(s1Chars.size() == s2Chars.size()){
            for(Integer i = 0; i < s1Chars.size(); i++){
                if(s1Chars[i] != s2Chars[i]){ return false; }
            }
        } else {
            return false;
        }

        return true;
    }

    return false;
}