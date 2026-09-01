/*
Given a string employeeId a map of string to string employeeIdToEmail that contains employee IDs as
 keys and the employee's email address as the value, 
return the email associated with the passed employeeId. If the employee ID is not found, return 'info@apexsandbox.io'.

*/

public String employeeEmail(Map<String, String> employeeIdToEmail, String employeeId) {
    if(employeeIdToEmail.containsKey(employeeId)){
        return employeeIdToEmail.get(employeeId);
    } else {
        return 'info@apexsandbox.io';
    }
}