public Boolean isValid(String s){

    String [] chars = s.split('');
    Integer count = 0;
    Integer countMatch = 0;

    if(Math.mod(chars.size(), 2) == 0){

        for(String i: chars){
            count = 0;
            countMatch = 0;

            Switch on i {
                when '(' {
                    for(String l: chars){
                        if(i.equals(l)){ count++; }

                        if(l.equals(')')){ countMatch++; }
                    }
                    
                    if(count != countMatch){ return false; }
                }

                when '{' {
                    for(String l: chars){
                        if(i.equals(l)){ count++; }

                        if(l.equals('}')){ countMatch++; }
                    }

                    if(count != countMatch){ return false; }
                }

                when '[' {
                    for(String l: chars){
                        if(i.equals(l)){ count++; }

                        if(l.equals(']')){ countMatch++; }


                    }

                    if(count != countMatch){ return false; }
                }
            }
        }

        return true;
    }

    return false;

}