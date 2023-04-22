//everyday 9 PM , run the apex and delete all the account which contains name test
public with sharing class scheduleApexDemo implements Schedulable{
    public void execute(SchedulableContext sc){
        List<Account> accList = [select id,name from account where name like '%test%' with SYSTEM_MODE];
        if(!accList.isEmpty()){
            try {
                delete as SYSTEM accList;                
            } catch (Exception ex) {
                System.debug('Error while deleting the account');
            }
        }
    }
}

//1. Apex Schedular : setup --> Apex Classes
//2. System.schedule('Delete bad accounts','0 0 21 ? * MON,TUE,WED,THU,FRI *',new scheduleApexDemo());
// https://www.freeformatter.com/cron-expression-generator-quartz.html