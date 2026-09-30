public with sharing class TaskTriggerHandler extends TriggerHandler{
    private List<Task> tasks; 
    private static final String OPEN_TASK_ERROR = 'Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.';

    public TaskTriggerHandler() {
        this.setMaxLoopCount(1);
        this.tasks = (List<Task>) Trigger.new;
    }

    public override void beforeInsert(){
        Set<Id> caseIds = new Set<Id>();

        for (Task task : this.tasks) {
            if (task.WhatId != null && task.WhatId.getSObjectType() == Case.SObjectType) {
                caseIds.add(task.WhatId);
            }
        }

        if (caseIds.isEmpty()) {
            return;
        }

        Set<Id> caseIdsWithOpenTasks = new Set<Id>();
        List<Task> temp = [SELECT WhatId
                            FROM Task
                            WHERE WhatId IN :caseIds AND Status IN ('Not Started', 'In Progress', 'Waiting on someone else')];

        for (Task existingTask : temp) { caseIdsWithOpenTasks.add(existingTask.WhatId); }

        for (Task task : this.tasks) {
            if (caseIdsWithOpenTasks.contains(task.WhatId)) {
                task.addError(OPEN_TASK_ERROR);
            }
        }
    }
}