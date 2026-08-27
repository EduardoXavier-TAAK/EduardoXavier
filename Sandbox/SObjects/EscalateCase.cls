/*
In-progress cases dealing with mechanical or electrical breakdown need to be escalated. 
Implement a method escalateIfMeetsCriteria that takes as input a Case record, 
and sets the IsEscalated field to true if Type is Mechanical or Electrical, 
Reason is Breakdown, and Status is In Progress
*/

public void escalateIfMeetsCriteria(Case c) {

    if(c.Type?.equals('Mechanical') || c.Type?.equals('Electrical')){

        if(c.Reason?.equals('Breakdown') && c.Status?.equals('In Progress')){ c.IsEscalated = true; }

    }
}