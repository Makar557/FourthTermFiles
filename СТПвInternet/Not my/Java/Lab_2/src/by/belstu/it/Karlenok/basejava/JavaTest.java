package by.belstu.it.Karlenok.basejava;
/*
@author Karlenok Yura
@version 1.0
*/

/*
TODO d) Выполните статический импорт
*/
import static java.lang.Math.*;

public class JavaTest
{
    /*
    TODO a) Использовать пакеты by.belstu.it.фамилия.basejava
    Создайте в нем класс JavaTest c методом main (наберите просто
    psvm ). В дальнейшем запускайте main.
    */

    static int sint = 5;

    /*
    @return void
    @throws none
    @param none
    */
    public static void main(String[] args)
    {
        /*
        TODO b) Определить перемнные типа char, int, short, byte, long, boolean.
        Выполнить над ними следующие операции
         */
        char tchar = 'c';
        int tint = 16052000;
        short tshort = 1605;
        byte tbyte = 16;
        long tlong = 1605200020022019l;
        boolean tbool = true;

        System.out.println("Строка + " + tint);
        System.out.println("Строка + " + tchar);
        System.out.println("Строка + " + 3.1415d);

        /*
        @value 16
        @see pby.belstu.it.Karlenok.basejava.JavaTest
        */
        tbyte += tint;
        System.out.println("Byte = byte + int = " + tbyte);

        int newTint = (int)(3.1415d + tlong);
        System.out.println("Int = double + long = " + newTint);

        long newTlong = tint + 2147483647;
        System.out.println("Long = tint + 2147483647 = " + newTlong);

        System.out.println("Sint = " + sint);

        boolean andBool = tbool && tbool;
        System.out.println("Boolean = boolean && boolean = " + andBool);

        boolean orBool = tbool || tbool;
        System.out.println("Boolean = boolean || boolean = " + orBool);

        //boolean newBool = tbool + tbool;

        long first = 9223372036854775807l;
        long second = 0x7fff_ffff_fffl;

        char charA = 'a';
        System.out.println(charA);
        char char0061 = '\u0061';
        System.out.println(char0061);
        char char97 = 97;
        System.out.println(char97);
        System.out.println((char)(charA + char0061 + char97));

        System.out.println("3.45 % 2.4 = " + (3.45 % 2.4));

        System.out.println("1.0 / 0.0 = " + (1.0 / 0.0));

        System.out.println("0.0 / 0.0 = " + (0.0 / 0.0));

        System.out.println("log(-345) = " + (log(-345)));

        System.out.println(Float.intBitsToFloat(0x7F800000));

        System.out.println(Float.intBitsToFloat(0xFF800000));

        //System.out.println(CONST_1);
        //System.out.println(CONST_2);
        System.out.println(CONST_3);

        MathFunc();
        ShellFunc();
        StringFunc();
        ArrayFunc();

        /*
        TODO h) Создайте класс WrapperString c приватным полем типа String
        */
        String wsString = "Привет";
        WrapperString ws = new WrapperString(wsString);
        System.out.println(ws.Getter());
        ws.Setter("Пока");
        System.out.println(ws.equals(ws));
        System.out.println(ws.hashCode());
        System.out.println(ws.toString());
        System.out.println(ws.replace('о','и'));
        System.out.println(ws.delete('П'));
    }

    /*
    TODO c) Задайте две константы в классе
    */
    final int CONST_1 = 3;
    public final int CONST_2 = 3;
    public static final int CONST_3 = 3;

    public static void MathFunc()
    {
        System.out.println("PI = " + Math.PI);
        System.out.println("E = " + Math.E);
        long roundPI = Math.round(Math.PI);
        System.out.println("Round(PI) = " + roundPI);
        long roundE = Math.round(Math.E);
        System.out.println("Round(E) = " + roundE);
        System.out.println("Min(PI, E) = " + Math.min(roundPI, roundE));

        System.out.println("Random = " + random()%1);
    }

    /*
    TODO e) Создать объекты разных классов оболочек (Boolean,
    Character, Integer, Byte, Short, Long, Double)
    */
    public static void ShellFunc()
    {
        Character sChar   = new Character('c');
        Integer   sInt    = new Integer(16052000);
        Short     sShort  = new Short((short)1606);
        Long      sLong   = new Long (16062000l);
        Double    sDouble = new Double(3.1415);

        int nInt = ~sInt;
        System.out.println("~Integer = " + nInt);

        char newChar = 'h';
        newChar += sChar;
        System.out.println("+Char = " + newChar);

        int short_1 = sShort >> 2;
        System.out.println(short_1);
        int short_2 = sShort >>> 2;
        System.out.println(short_2);

        long andLong = sLong & 111;
        System.out.println("Long & 111 = " + andLong);

        System.out.println("longMIN = " + sLong.MIN_VALUE);
        System.out.println("longMAX = " + sLong.MAX_VALUE);
        System.out.println("doubleMIN = " + sDouble.MIN_VALUE);
        System.out.println("doubleMAX = " + sDouble.MAX_VALUE);

        Integer boxInt = new Integer(1605);
        int uboxInt = boxInt;
        Byte boxByte = new Byte((byte)16);
        byte uboxByte = boxByte;

        System.out.println(Integer.parseInt("16"));
        System.out.println(Integer.toHexString(10)) ;
        System.out.println(Integer.compare(10, 2));
        System.out.println(Integer.toString(123, 2));
        System.out.println(Integer.bitCount(123));
    }

    /*
    TODO f) Выполните преобразование числа типа String (String s34 = "2345";)
    к int , используя: конструктор, valueOf, parse….
    */
    public static void StringFunc()
    {
        String s34 = "2345";
        Integer constructor = new Integer(s34);
        System.out.println(constructor);
        System.out.println(Integer.valueOf(s34));
        System.out.println(Integer.parseInt(s34));

        byte[] byteString = s34.getBytes();
        System.out.println(byteString);
        String stringByte = new String(byteString);
        System.out.println(stringByte);

        System.out.println(Boolean.valueOf(s34));
        System.out.println(Boolean.getBoolean(s34));

        String string_1 = "Yura";
        String string_2 = "Yura";
        System.out.println(string_1 == string_2);
        System.out.println(string_1.equals(string_2));
        System.out.println(string_1.compareTo(string_2));
        //string_2 = null;
        System.out.println(string_1 == string_2);
        System.out.println(string_1.equals(string_2));
        System.out.println(string_1.compareTo(string_2));

        String endString = new String("Я простая строка");
        for(String retval : endString.split(" ")){
            System.out.println(retval);
        }
        System.out.println(endString.contains("стро"));
        System.out.println(endString.hashCode());
        System.out.println(endString.indexOf("стро"));
        System.out.println(endString.length());
        System.out.println(endString.replace("простая", "изи"));
    }

    /*
    TODO g) Проверьте какая из форм объявлений многомерного массива допустима
    */
    public static void ArrayFunc()
    {
        char[][] c1;
        int[] c2[];
        int c3[][];

        int test[] = new int[0];

        //System.out.println(test[2]);

        c1 = new char[3][];
        c1[0] = new char[0];
        c1[1] = new char[1];
        c1[2] = new char[2];
        System.out.println(c1.length);
        System.out.println(c1[0].length);
        System.out.println(c1[1].length);
        System.out.println(c1[2].length);

        c2 = new int[][]{ {1,2,3}, {4,5,6}, {7,8,9}};
        c3 = new int[][]{ {1,2,3}, {4,5,6}, {7,8,9}};
        boolean comRez = c2 == c3;
        System.out.println(comRez);
        c2 = c3;

        for (int[] array : c2)
        {
            for (int elem: array)
            {
                System.out.println(elem);
            }
        }
    }
}
