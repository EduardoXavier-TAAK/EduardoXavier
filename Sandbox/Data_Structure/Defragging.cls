
public void defragging(Integer[] memory)
{
    Integer count = 0;
    
    While(count < memory.size())
    {
        Integer index = memory.indexOf(-1);

        if(index != -1){
            memory.remove(index);
            memory.add(-1);

            count++;

        }  else {
            break;
        }
    }

}