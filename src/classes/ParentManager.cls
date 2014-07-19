public with sharing class ParentManager {

	public static Id getParentAccountId(){
		Id AccountId = null;
		User u = [Select u.Id, u.AccountId From User u Where u.Id=:Userinfo.getUserId()];
		if(u != null && u.AccountId != null){
			AccountId = u.AccountId;
		}
		return AccountId;
	}

}