public with sharing class CalendarController {

public CalendarController(){

	list<CEvent> Eve = new list<CEvent>();
	//Eve.add(new CEvent('All Day Event','2014-07-20'));
	//Eve.add(new CEvent('All Day Event','2014-07-25'));
	Eve = getEvents();
	
		
	JSONDATA = JSON.serialize(Eve);
				
}

public static list<CEvent> getEvents(){
	list<CEvent> EventList = new list<CEvent>();
	list<Event__c> EvList = [Select e.Type__c, e.Start_Date_Time__c, e.Purpose__c, e.Name, e.Id, e.End_Date_Time__c, e.Description__c From Event__c e];
	for(Event__c ev : EvList){
		string title = ev.name+' ('+ ev.Type__c +')';
		datetime dt = ev.Start_Date_Time__c;
		EventList.add(new CEvent(title, string.valueOf(dt)));
	}
	return EventList;
}

 
public string JSONDATA{get;set;}




public class CEvent{
	
	public string title{get;set;}
	public string start{get;set;}
	public string enddate{get;set;}

	public CEvent(string title, string start){
		this.title = title;
		this.start = start;
		//this.enddate=enddate;
	}
}

}