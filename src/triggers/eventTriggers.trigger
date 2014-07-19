trigger eventTriggers on Event__c (after insert, after update) {

notifyParentforEvent.notifyParents(trigger.newMap.Keyset());

}