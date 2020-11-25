package ex.JDBS;

import java.sql.*;

public class Main {
    public static void main(String[] args) {

        String instanceName = "DESKTOP-QB4V7KB";
        String databaseName = "Экзамен";
        String userName = "Liz";
        String pass = "0";
        String connectionUrl = "jdbc:sqlserver://%1$s;databaseName=%2$s;user=%3$s;password=%4$s;";
        String connectionString = String.format(connectionUrl, instanceName, databaseName,   userName, pass);

        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(connectionString);
            Statement stmt = connection.createStatement();

            stmt.executeUpdate("drop table MyTable");
            stmt.executeUpdate("create table MyTable (Id int not null IDENTITY(1,1) PRIMARY KEY, Name varchar(20)) ");

            stmt.executeUpdate("insert into MyTable (Name) values ('Liz')");
            stmt.executeUpdate("insert into MyTable (Name) values ('Vika')");
            stmt.executeUpdate("insert into MyTable (Name) values ('Dima')");

            PreparedStatement preparedStatement =connection.prepareStatement("insert into MyTable (Name) values (?)");
            preparedStatement.setString(1, "Sonya");
            preparedStatement.executeUpdate();

            preparedStatement =connection.prepareStatement("insert into MyTable (Name) values (?)");
            preparedStatement.setString(1, "Anya");
            preparedStatement.executeUpdate();

            ResultSet resultSet = stmt.executeQuery("select * from MyTable");
            while(resultSet.next())
            {
                System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2));
            }


        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
    }
}
