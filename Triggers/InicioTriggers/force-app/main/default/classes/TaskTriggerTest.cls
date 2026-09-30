/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class TaskTriggerTest {

    @testSetup
    static void createCases() {
        insert new List<Case>{
            new Case(
                Subject = 'Test case with open task',
                Status = 'Not Started',
                Origin = 'Phone'
            ),
            new Case(
                Subject = 'Test case without open task',
                Status = 'Not Started',
                Origin = 'Phone'
            )
        };

        Case caseWithOpenTask = [
            SELECT Id
            FROM Case
            WHERE Subject = 'Test case with open task'
            LIMIT 1
        ];
        insert new Task(
            Subject = 'Existing open task',
            Status = 'Not Started',
            WhatId = caseWithOpenTask.Id
        );
    }

    @isTest
    static void blocksNewTaskWhenCaseHasOpenTask() {
        Case relatedCase = [
            SELECT Id
            FROM Case
            WHERE Subject = 'Test case with open task'
            LIMIT 1
        ];
        System.assertEquals(
            1,
            [SELECT COUNT() FROM Task WHERE WhatId = :relatedCase.Id AND Status = 'Not Started'],
            'O cenário deve começar com uma tarefa aberta no Caso.'
        );
        Task newTask = new Task(
            Subject = 'Another task',
            Status = 'Not Started',
            WhatId = relatedCase.Id
        );

        Test.startTest();
        Database.SaveResult result = Database.insert(newTask, false);
        Test.stopTest();

        System.assertEquals(false, result.isSuccess(), 'A tarefa deveria ser bloqueada.');
        System.assert(
            result.getErrors()[0].getMessage().contains(
                'Já existe uma tarefa em aberto nesse caso. Encerre-a antes de abrir uma nova.'
            ),
            'A mensagem de erro deve explicar por que a tarefa foi bloqueada.'
        );
    }

    @isTest
    static void allowsNewTaskWhenCaseHasNoOpenTask() {
        Case relatedCase = [
            SELECT Id
            FROM Case
            WHERE Subject = 'Test case without open task'
            LIMIT 1
        ];

        Task newTask = new Task(
            Subject = 'First task',
            Status = 'Not Started',
            WhatId = relatedCase.Id
        );

        Test.startTest();
        insert newTask;
        Test.stopTest();

        System.assertNotEquals(null, newTask.Id, 'A tarefa deveria ser criada.');
    }
}