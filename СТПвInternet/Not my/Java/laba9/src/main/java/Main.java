import rx.Observable;
import rx.subjects.BehaviorSubject;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) throws IOException {
        System.out.println("First task on RxJava");
        BehaviorSubject<Integer> a = BehaviorSubject.create();
        BehaviorSubject<Integer> b = BehaviorSubject.create();
        Observable<Integer> c = Observable.combineLatest(a,b,(i1, i2) -> i1+i2);
        c.subscribe (System.out::println);
        a.onNext(10);
        b.onNext(10);
        a.onNext(20);

        System.out.println("Second task on RxJava");
        Observable<Integer> cIn2 = c.map(i->i*i);
        cIn2.subscribe (System.out::println);
        a.onNext(1);
        b.onNext(2);
        a.onNext(3);
        Observable<Integer> cEven = c.filter(i->i%2==0);
        cEven.subscribe (System.out::println);

        System.out.println("Web programming");
        try(Socket socket = new Socket()) {
            socket.connect(new InetSocketAddress("india.colorado.edu", 13), 2000);
            Scanner scanner = new Scanner(socket.getInputStream());
            while (scanner.hasNextLine()) {
                System.out.println(scanner.nextLine());
            }
        }
    }
}
