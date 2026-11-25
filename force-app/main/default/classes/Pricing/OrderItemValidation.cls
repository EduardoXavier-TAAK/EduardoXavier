public with sharing class OrderItemValidation {
    public OrderItemValidation() {}   

    public boolean validateOrderItem(OrderItem i) {
        boolean isValid = true;
        
        if(i.Quantity == null || i.Quantity <= 0) {
            i.addError('A quantidade do produto deve ser maior que zero.');
            isValid = false;
        }
        
        if(i.UnitPrice == null || i.Unitprice <= 0) {
            i.addError('O preço do produto deve ser maior que zero.');
            isValid = false;
        }
        
        return isValid;
    }   
}