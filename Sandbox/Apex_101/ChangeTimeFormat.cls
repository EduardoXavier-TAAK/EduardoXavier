/*
13:50 and 01:50 PM are 24-hour and 12-hour representations of the same time. Implement the method changeTimeFormat that 
takes as input a string strTime formatted as a 24-hour string, and returns the equivalent 12-hour string.
*/

public String changeTimeFormat(String strTime) {
   String timeofDay='AM';
   Integer hour = Integer.valueOf(strTime.substringBefore(':'));
   String minutes=strTime.substringAfter(':'); 


   if (hour==12) timeofDay ='PM';
   
   if(hour>12) { timeofDay ='PM'; hour= hour-12; }   
  if (hour==0){ timeofDay ='AM'; hour=12; }

  String strHour=string.valueof(hour);
  if (strHour.length()==1) strhour= '0'+hour;
  return strHour + ':'+ minutes + ' '+ timeofDay;
   }