//for the all accounts which does not have industry , update the rating as cold
public with sharing class QueuableApex implements Queueable {
  public void execute(QueueableContext context) {
    List<Account> accList = [
      SELECT id, name, rating
      FROM Account
      WHERE Industry = NULL
      WITH USER_MODE
    ];
    for (Account acc : accList) {
      acc.Rating = 'Cold';
    }
    if (!accList.isEmpty()) {
      try {
        update accList;
      } catch (Exception ex) {
        System.debug('Exceptions ' + ex.getMessage());
      }
    }
  }
}

/**
 *
 * System.enqueueJob(new QueuableApex());
 */

