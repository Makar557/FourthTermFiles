package com.ServletTest.Classes;

public class User {

    private User(){}
    private static User currentUser = null;

    public static User Initialize(){
        if(currentUser == null)
            currentUser = new User();
        return currentUser;
    }

    private String username;
    private String password;



    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
