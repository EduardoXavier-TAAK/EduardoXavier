public with sharing class marginValidationTrigger implements TriggerAction.BeforeInsert {
  public marginValidationTrigger() {
  }

  public void beforeInsert(List<Margin__c> triggerNew) {
    for (Margin__c iMargin : triggerNew) {
      Boolean location =
        iMargin.City__c == null &&
        iMargin.State__c == null &&
        iMargin.Country__c == null;
      Boolean client =
        iMargin.Account__c == null &&
        iMargin.Account_Group__c == null;
      Boolean product =
        iMargin.Product__c == null &&
        iMargin.Product_Hierarchy__c == null;

      if (location)
        iMargin.AddError(
          'Campo: Cidade, Estado ou País precisam estar preenchidos!'
        );

      if (client)
        iMargin.AddError(
          'Campo: Cliente ou Grupo de Clientes precisam estar preenchidos!'
        );

      if (product)
        iMargin.AddError(
          'Campo: Produto ou Hierarquia de Produtos precisam estar preenchidos!'
        );
    }
  }
}
