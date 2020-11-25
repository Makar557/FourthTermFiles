package bstu.Main;

import java.sql.*;

public class Main
{
    public static void main(String[] args)
    {
        String instanceName = "DESKTOP-QB4V7KB";
        String databaseName = "Java7";
        String userName = "Liz";
        String pass = "0";
        String connectionUrl = "jdbc:sqlserver://%1$s;databaseName=%2$s;user=%3$s;password=%4$s;";
        String connectionString = String.format(connectionUrl, instanceName, databaseName, userName, pass);

        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conect = DriverManager.getConnection(connectionString);
            Statement stmt = conect.createStatement();

            ResultSet resultSet = stmt.executeQuery("select top(1) Sender from Letters order by LEN(Letters.Text) desc");
            while(resultSet.next())
            {
                System.out.println("Biggest sender: " + resultSet.getString(1));
            }

            String PrepareQuary = "select Receiver from Letters where Letters.Title = ?", Title = "Папа";
            PreparedStatement preparedStatement = conect.prepareStatement(PrepareQuary);
            preparedStatement.setString(1, Title);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                System.out.println("Receivers with title " + Title + ": " +resultSet.getString(1));
            }

            PrepareQuary = "select Receiver from Letters where Letters.Title != ?";
            preparedStatement = conect.prepareStatement(PrepareQuary);
            preparedStatement.setString(1, Title);
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                System.out.println("Receivers without title " + Title + ": " +resultSet.getString(1));
            }


            String Sender = "Катя"; Title = "BSTU";
            preparedStatement = conect.prepareStatement("select * from Letters where Letters.Title = ? and Letters.Sender = ?");
            preparedStatement.setString(1, Title); preparedStatement.setString(2, Sender);


            ResultSet resSet;
            PreparedStatement insertPrepStm = conect.prepareStatement("insert into Letters(Sender, Receiver, Title, Text, Send_Date) values(?,?,?,?,?)");
            resultSet = preparedStatement.executeQuery();
            while(resultSet.next())
            {
                resSet = stmt.executeQuery("select Receiver from Letters");
                while(resSet.next())
                {
                    insertPrepStm.setString(1, resultSet.getString(1));
                    insertPrepStm.setString(2, resSet.getString(1));
                    insertPrepStm.setString(3, resultSet.getString(3));
                    insertPrepStm.setString(4, resultSet.getString(4));
                    insertPrepStm.setDate(5, resultSet.getDate(5));

                    insertPrepStm.executeUpdate();
                }
            }
        }
        catch(Exception ex)
        {
            System.out.println(ex.getMessage());
        }
    }
}
