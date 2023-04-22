public with sharing class FutureMethodDemo {
  public static void mixDmlError(String username) {
    createAccount();
    updateProfile(username);
  }

  public static void createAccount() {

    //nonsetup
    Account acc = new Account(name = 'Welcome to learn Future Method');
    insert acc;
  }

  @future
  public static void updateProfile(String username) {

    //setup
    List<User> userList = [
      SELECT id, username, profileId
      FROM user
      WHERE username = :username 
    ];

    Profile prf = [
      SELECT id, name
      FROM profile
      WHERE name = 'Chatter Moderator User' with USER_MODE
    ];

    for (User usr : userList) {
      usr.profileId = prf.Id;
    }

    if (!userList.isEmpty()) {
      update as user userList;
    }
  }
}
