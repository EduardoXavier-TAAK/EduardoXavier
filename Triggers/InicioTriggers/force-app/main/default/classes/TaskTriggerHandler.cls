public with sharing class TaskTriggerHandler extends TriggerHandler{
    private List<Task> tasks; 

    public TaskTriggerHandler() {
        this.setMaxLoopCount(1);
        this.tasks = (List<Task>) Trigger.new;
    }

    public override void beforeInsert(){
        List<Task> cases = [SELECT WhatId FROM Task WHERE Id IN :this.tasks AND Status IN ('Not Started', 'In Progress', 'Waiting')];

        if(!cases.isEmpty()){
            throw new IllegalArgumentException('Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.');
        }
        
        insert cases;
    }
}