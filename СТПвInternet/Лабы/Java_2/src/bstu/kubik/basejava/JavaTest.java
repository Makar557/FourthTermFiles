package bstu.kubik.basejava;

import java.util.Objects;

import static java.lang.Math.*;
import static  java.lang.StrictMath.log;



public class JavaTest {

    static int sint;

    ///  c
    final float PI1 = 3.14f;
    public final int FINAL_VAR_INT = 123;
    public static final int STATIC_FINAL_VAR_INT = 123;


    ///  b

    public static void main(String[] args) {

        char charVar1 = 'a';
        char charVar2 = '\u0061';
        char charVar3 = 97;
        int intVar = 1234;
        short shortVar = 123;
        byte byteVar = 12;
        long longVar = 12345;
        double doubleVar = 123.123;
        boolean booleanVar = true;
        String stringVar = "Li";

        stringVar = stringVar + intVar;
        stringVar = stringVar + charVar1;
        stringVar = stringVar + doubleVar;
        byteVar = (byte) (byteVar + intVar);
        intVar = (int) (doubleVar + longVar);
        longVar = intVar + 2147483647;

        System.out.println("Default value of static int is " + sint);

        booleanVar = booleanVar && booleanVar;
        booleanVar = booleanVar ^ booleanVar;
        //booleanVar=booleanVar+booleanVar; нельзя

        long longVar2 = 9223372036854775806l;
        long intVar2 = 0x7fff_ffff_fffl;

        System.out.println(charVar1 + charVar2 + charVar3);
        System.out.println(3.45 % 2.4);
        System.out.println(1.0 / 0.0);
        System.out.println(0.0 / 0.0);
        System.out.println(log(-345));

        float posiveInfinity = Float.intBitsToFloat(0x7F800000);
        float negInfinity = Float.intBitsToFloat(0xFF800000);

        ///  d

        System.out.println(PI);
        System.out.println(E);
        System.out.println(round(PI));
        System.out.println(round(E));
        System.out.println(min(PI, E));
        System.out.println(random());
        System.out.println(random() * (10 - 1) + 1);

        ///  e

        Boolean BooleanVar = true;
        Character CharacterVar = 'f';
        Long LongVar = 12345l;
        Integer IntegerVar1;
        Integer IntegerVar2 = 1234;
        IntegerVar1 = IntegerVar2 >> 1;
        IntegerVar1 = IntegerVar2 >>> 3;
        IntegerVar1 = ~IntegerVar2;

        System.out.println("Long.MIN_VALUE = " + Long.MIN_VALUE);
        System.out.println("Long.MAX_VALUE = " + Long.MAX_VALUE);

        System.out.println("Double.MIN_VALUE = " + Double.MIN_VALUE);
        System.out.println("Double.MAX_VALUE = " + Double.MAX_VALUE);


        int newVarInt = IntegerVar1;

        IntegerVar1 = Integer.parseInt("324");
        System.out.println("15 in hex is " + Integer.toHexString(15));
        System.out.println("Count of bits in 16: " + Integer.bitCount(7));

        IntegerVar1 = new Integer("2345");
        System.out.println("011011" + Integer.valueOf("011011", 2));

        BooleanVar = Boolean.parseBoolean("True"); //+
        BooleanVar = Boolean.parseBoolean("asd"); //-
        BooleanVar = Boolean.valueOf("22");//-
        BooleanVar = Boolean.valueOf("true");//+
        BooleanVar = Boolean.valueOf("yes");//-
        BooleanVar = Boolean.valueOf("1");//-
        BooleanVar = Boolean.valueOf("0");//-
        BooleanVar = Boolean.valueOf("");//-
        BooleanVar = Boolean.valueOf("Hello");//-

        byte[] b = "string".getBytes();
        String s = new String(b);

        String s1 = "a:b:c";
        String s2 = "a:b:c";

        if (s1 != s2)
            System.out.println("references are not equal");

        if (s1.equals(s2))
            System.out.println("s2 is not null and chars of s1 are same with s2");

        String s1_splited[] = s1.split(":");
        s1.contains("a:b:c");
        System.out.println(s1.hashCode());

        char[][] c1;
        char[] c2[];
        char c3[][];

        char c4[] = null;
        c4 = new char[]{1, 2, 3};

        for (var i : c4)
            System.out.println(i);


        WrapperString wrapperString = new WrapperString("Hello")
        {
            @Override
            public void replace(char oldChar, char newChar)
            {
                System.out.println("Overrided.");
                super.replace(oldChar, newChar);
            }

            public void delete(char c)
            {
                setStr(getStr().replace(c, '\0'));
            }
        };
        wrapperString.delete('H');
    }
}
    /**
     * Class WrapperString
     * @author Elizaveta Kubik
     * @version 1.0
     */
    class WrapperString
    {
        /**
         * This is main string
         * @value "string value"
         * */
        private String str;

        /** Construstor
         * @param str
         * */
        public WrapperString(String str)
        {
            this.str = str;
        }

        /** Getter
         * @return String
         * */
        public String getStr()
        {
            return str;
        }

        /** Setter
         * @param str
         * @return String
         * */
        public void setStr(String str)
        {
            this.str = str;
        }

        /** Overloaded equals function
         * @param o
         * @return String
         * */
        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            WrapperString that = (WrapperString) o;
            return Objects.equals(str, that.str);
        }

        /** Overloaded hashCode function
         * @return int
         * */
        @Override
        public int hashCode()
        {
            return Objects.hash(str);
        }

        /** replace
         * @param oldChar
         * @param newChar
         * @return void
         * */
        public void replace(char oldChar, char newChar)
        {
            str.replace(oldChar, newChar);
        }

        /** delete
         * @param c
         * @return void
         * */
        public void delete(char c){}

    }
