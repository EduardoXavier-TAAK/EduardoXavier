public with sharing class OrderSender implements TriggerAction.AfterUpdate {

    public void afterUpdate(List<Order> triggerNew, List<Order> triggerOld){
        Map<Id, Order> orderOld = new Map<Id, Order>(triggerOld);

        for(Order i : triggerNew){
            Order temp = orderOld.get(i.Id);

            if(temp.Status == 'Draft' && i.Status == 'Activated') IntegrationOutbound.orderOutbound(i.Id);
            
        }
    }
}