public with sharing class TimeTableManager {


	
	public static list<Time_Table_Detail__c> getTimeTableDetails(Id TimeTableId){
		list<Time_Table_Detail__c> TTD = [Select t.Time_Table__c, t.Subject__c, t.Start_Time__c, t.Name, t.Id, t.Faculty__c, t.End_Time__c, t.Day__c From Time_Table_Detail__c t Where t.Time_Table__c=:TimeTableId];
		return TTD;
	}
	
}