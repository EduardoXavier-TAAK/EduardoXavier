public with sharing class TaskTriggerHandler extends TriggerHandler{
    private List<Task> tasks;
    
    public TaskTriggerHandler() {
        this.setMaxLoopCount(5);
        this.tasks = (List<Task>) Trigger.new;
    }
    
    public override void beforeInsert(){
        Set<Id> caseIds = new Set<Id>();
        
        
        for (Task task : this.tasks) {
            Boolean isWhatIdNull = task.WhatId == null;
            
            Boolean isCaseType = task.WhatId.getSObjectType() == Case.SObjectType;

            if (!isWhatIdNull && isCaseType) { caseIds.add(task.WhatId); } 
        }
        
        if (!caseIds.isEmpty()) {
            Set<Id> caseIdsWithOpenTasks = new Set<Id>();
            
            List<Task> temp = [SELECT WhatId FROM Task
                                             WHERE WhatId IN :caseIds 
                                             AND Status IN ('Not Started', 'In Progress', 'Waiting on someone else')];
            
            for (Task existingTask : temp) { caseIdsWithOpenTasks.add(existingTask.WhatId); }
            
            for (Task task : this.tasks) {
                
                if (caseIdsWithOpenTasks.contains(task.WhatId)) {
                    task.addError('Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.');
                }
            }
        }
    }
}