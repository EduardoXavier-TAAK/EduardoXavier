public with sharing class LaAfterUpdateInsertAtm implements TriggerAction.AfterUpdate {
    private AfterUpdateService service;
    
    public LaAfterUpdateInsertAtm() {}
    
    public void afterUpdate(List<AssociatedLocation> triggernew, List<AssociatedLocation> triggerold){
        
        List<AssociatedLocation> oldUsers = new List<AssociatedLocation>();
        
        for(Integer i = 0; i < triggernew.size(); i++){
            try{
                oldUsers.add(service.fieldChange(triggernew[i], triggerold[i], 'User'));
                
            } catch(IllegalArgumentException e){
                System.debug('Campo não foi alterado');
                continue;
            }
        }
        
        for(AssociatedLocation i : oldUsers){
            if(!service.moreThanOneLa(i, 'User')){ delete i; }
        }
        
    }
}