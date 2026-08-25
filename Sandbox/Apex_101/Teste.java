package week_1.week_1_exercises;

public class Teste {
    public static void main(String[] args) {
        String plant1 = "lettuce";
        String plant2 = "cucumbers";
    
        String [][] comp =  new String[][]{{"lettuce", "cucumbers"}, {"lettuce", "onions"}, {"onions", "carrots"}, {"onions", "tomatoes"}};

        for(int i = 0; i < 4; i++){
            for(int j = 0; j < 2; j++){
                if(plant1 != plant2){
                    if((comp[i][j].equals(plant1) || comp[i][j].equals(plant2)) && 
                        (comp[i][j].equals(plant2) || comp[i][j].equals(plant2))){
                            System.out.println("true");
                        }
            }

            }
        }

    }
}