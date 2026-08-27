/*
Some plants are considered companion plants. They grow better when planted next to each other. 
For the purpose of this problem, we consider the following plants to be companions: lettuce and cucumbers, 
lettuce and onions, onions and carrots, and onions and tomatoes.
Write a function isCompanion that takes as input two strings plant1 and plant2. 
If the two plants are companion plants based on the criteria described above, return true. Otherwise, return false.
*/

public Boolean companionPlants(String plant1, String plant2) {
    String [] enviadas = new String[]{plant1, plant2};

    for(Integer i = 0; i < 2; i++){
            if(enviadas[i].equals('onions')){
                for(Integer j = 0; j < 2; j++){
                    if(enviadas[j].equals('lettuce')) { return true; }
                    if(enviadas[j].equals('carrots')) { return true; }
                    if(enviadas[j].equals('tomatoes')) { return true; }
                }
            }


            if(enviadas[i].equals('lettuce')){
                for(Integer j = 0; j < 2; j++){
                    if(enviadas[j].equals('cucumbers')) { return true; }
                }
            }

            
        }
            return false;
    }
   
