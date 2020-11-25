package com.ServletTest.Classes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataProcessor {

    public static boolean IsSuchUserExist(String username, String password){
        DBConnector connector = new DBConnector(username, password);
        boolean status = false;
        try (Connection connection = connector.GetConnection()){
            ResultSet users = connector.GetUsers(connection);
            if(users.next()){
                 status = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return status;
    }

    public static void RegisterUser(String username, String password){
        DBConnector connector = new DBConnector(username, password);
        try (Connection connection = connector.GetConnection()){
            connector.RegisterUser(connection);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
