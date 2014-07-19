public class notifyParentforEvent{
    
    @future(callout=true)
    public static void notifyParents(set<Id> eventIdSet){
       map<id, Account> parentAccMap = new map<id, Account>();
       For(Account acc : [select id from Account where Type =: 'Parent']){
            parentAccMap.put(acc.Id, acc);
       }         
       list<user> userList = new list<user>(); 
       userList = [Select id, ContactId from User WHERE AccountId =: parentAccMap.keyset() AND ContactId != null AND isActive =: true];
        
       
       for(Event__c ev : [select Id, Purpose__c, Start_Date_Time__c from Event__c where ID IN: eventIdSet]){
           for(user us : userList){
              String sText = 'Please Join on : '+ev.Purpose__c+'{'+us.id+'}!';
              ConnectApi.FeedItem fi = ConnectApiHelper.postFeedItemWithMentions(null, 'me', sText);
           }
       }

       
       /* map<id, Account> parentAccMap = new map<id, Account>();
        list<user> userList = new list<user>(); 
        For(Account acc : [select id from Account where Type =: 'Parent']){
            parentAccMap.put(acc.Id, acc);
        }         
        userList = [Select id, ContactId from User WHERE AccountId =: parentAccMap.keyset()];
        
        list<event> eventInsertList = new list<Event>();
        for(Event__c ev : tempEventList){
            for(user us : userList){
                eventInsertList.add(createEvent(us,ev));
            }
        }
        //database.insert(eventInsertList, false);
        insert eventInsertList;
        */
    }
    
    Public static event createEvent(user usr, Event__c event){
        Event tempEvent = new Event();
        //tempEvent.ownerId = usr.Id;
        
        tempEvent.Subject = event.Purpose__c;
        tempEvent.Description = event.Description__c;
        tempEvent.StartDateTime= event.Start_Date_Time__c;
        tempEvent.EndDateTime= event.End_Date_Time__c;
        tempEvent.WhatId = event.Id; 
        tempEvent.IsVisibleInSelfService = true;
        
        tempEvent.IsReminderSet = true;
        return tempEvent;
    }


}