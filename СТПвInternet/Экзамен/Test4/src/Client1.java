public class Client1 {

    public static String ipAddr = "localhost";
    public static int port = 8080;

    public static void main(String[] args) {
        new ClientSomething(ipAddr, port);
    }
}