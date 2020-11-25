package connection;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class UserDao {

    private final ConnectionCreator  connectionCreator = new ConnectionCreator();

    public UserDao() throws ConnectionException {
    }


    public boolean isExists(String login) throws SQLException, ClassNotFoundException{
        Connection connection = connectionCreator.createConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT login FROM users WHERE login='" + login + "'" );
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            return true;
        } else {
            return false;
        }
    }

    public void addUser(String login, String password) throws SQLException, ClassNotFoundException {
        Connection connection = connectionCreator.createConnection();
        PreparedStatement statement = connection.prepareStatement("INSERT INTO users(login, password) VALUES('" + login + "','" + password + "')");
        statement.executeUpdate();
    }

    public boolean checkFor(String login, String password) throws SQLException, ClassNotFoundException {
        Connection connection = connectionCreator.createConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT password FROM users WHERE login='" + login +"'");
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            String retrievedPassword = resultSet.getString(1);
            if (retrievedPassword.equals(password)) {
                connection.prepareStatement("UPDATE users SET login_number = login_number + 1 WHERE login='" + login + "'");
                return true;
            }
        }
        return false;
    }

    public Date getLoginTimestamp(String login) throws SQLException, ClassNotFoundException {
        Connection connection = connectionCreator.createConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT last_login FROM users WHERE login='" + login + "'");
        ResultSet resultSet = statement.executeQuery();
        Date result;
        if (resultSet.next()) {
            result = resultSet.getDate(1);
        } else {
            throw new SQLException();
        }
        return result;
    }

    public int getLoginNumber(String login) throws SQLException, ClassNotFoundException {
        Connection connection = connectionCreator.createConnection();
        PreparedStatement statement = connection.prepareStatement("SELECT login_number FROM users WHERE login='" + login + "'");
        ResultSet resultSet = statement.executeQuery();
        int result;
        if (resultSet.next()) {
            result = resultSet.getInt(1);
        } else {
            throw new SQLException();
        }
        return result;
    }

}
