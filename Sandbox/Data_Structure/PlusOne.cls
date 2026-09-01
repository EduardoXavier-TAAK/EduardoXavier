/*
A large integer number is given as a List of Integers from 0 to 9. 
You have to add 1 to that number and modify the list to represent the resulting number.
Example 1:
Input: number = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].

Example 2:
Input: number = [9]
Output: [1,0]
*/

public void plusOne(List<Integer> numbers) 
{
    Integer lsSize = numbers.size();
    Integer lastDigit = numbers.get(lsSize - 1);

    if(lastDigit + 1 == 10)
    {
        for(Integer i = lsSize - 1; i >=0; i--)
        {
            if(i != 0)
            {
                if(numbers[i] + 1 == 10)
                {
                    numbers[i] = 0;

                    if(numbers[i - 1] + 1 != 10)
                    {
                        numbers[i - 1] += 1;
                        break;
                    }
                    
                }
            } else 
            {
                if(numbers[i] + 1 == 10)
                {
                    numbers[i] = 0;
                    numbers.add(0,1);

                } else 
                {
                    numbers[i] += 1;
                }
            }
        }

    } else 
    {
        numbers[lsSize - 1] += 1;
    }
}