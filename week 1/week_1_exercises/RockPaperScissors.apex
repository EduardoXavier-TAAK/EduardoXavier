/*
Rock beats scissors, scissors beats paper, paper beats rock. Implement the method rockPaperScissors that takes as parameters two strings player1 and player2 representing the moves played by player 1 and player 2, valid moves being 'rock', 'paper', and 'scissors'. Return 1 if player 1 wins, 2 if player 2 wins, and 0 if no one wins.
rockPaperScissors('rock', 'paper') = 2
rockPaperScissors('scissors', 'paper') = 1
rockPaperScissors('paper', 'paper') = 0
*/

public class RockPaperScissors(){
    public Integer rockPaperScissors(String player1, String player2) {
        
        if(player1.equals('rock') && player2.equals('scissors')){return 1;}
        if(player1.equals('paper') && player2.equals('rock')){return 1;}
        if(player1.equals('scissors') && player2.equals('paper')){return 1;}

        if(player1.equals(player2)){return 0;}

        return 2;


    }

}