public with sharing class StudentManager {

	public static list<Student__c> getStudentsByParent(Id ParentAccId){
		list<Student__c> StudentList = [Select s.Parent_Name__c, s.Name, s.Last_Name__c, s.Id, s.First_Name__c, s.Division__c From Student__c s Where s.Parent_Name__c=:ParentAccId];
		return StudentList;
	}
	
	public static set<Id> getDivisionsSet(Id ParentAccId){
		list<Student__c> StudentList = getStudentsByParent(ParentAccId);
		set<Id> DivisionIds = new set<Id>();
		if(!StudentList.isEmpty()){
			for(Student__c s:StudentList){
				if(s.Division__c != null){
					DivisionIds.add(s.Division__c);
				}
			}
		}
		return DivisionIds;
	}
}