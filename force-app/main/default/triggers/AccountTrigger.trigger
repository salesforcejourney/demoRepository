/**
 * If Account phone number is updated - Populate the description of account with both old and new phone no
 *
 * DML : Update
 * Type : Before
 * Trigger.old - old value
 * Trigger.new - new value
 */

/**
 * If Account is active and user try to delete the account - POpulate error message : 'Not Authorized to delete the account'
 *
 * DML : delete
 * Type : Before
 * Trigger.old - old value
 * Trigger.new - null
 */

/**
  * Whenever Account is created , create the contact , 
    link the contact with the account and 
    get phone number of account on the contact;
    * DML : Insert
 * Type : After
 * Trigger.old - null
 * Trigger.new - new records
  */

/**
  * Whenever Account phone is updated , 
  update the phone the same as account phone number for all related contacts, 
    
 * DML : Update
 * Type : After
 * Trigger.old - old records
 * Trigger.new - new records
  */
trigger AccountTrigger on Account(
  before update,
  before delete,
  after insert,
  after update
) {
  if (Trigger.isBefore) {
    if (Trigger.isUpdate) {
      AccountTriggerHandler.beforeUpdate(Trigger.new, Trigger.oldMap);
      //Business logic
    }

    if (Trigger.isDelete) {
      AccountTriggerHandler.beforeDelete(Trigger.old);
    }
  }
  if (Trigger.isAfter) {
    if (Trigger.isInsert) {
      AccountTriggerHandler.afterInsert(Trigger.new);
    }
    if (Trigger.isUpdate) {
        AccountTriggerHandler.afterUpdate(Trigger.new, Trigger.oldMap);
    }
  }
}
