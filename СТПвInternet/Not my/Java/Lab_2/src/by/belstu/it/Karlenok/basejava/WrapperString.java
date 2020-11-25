package by.belstu.it.Karlenok.basejava;

public class WrapperString
{
    public String str;

    public WrapperString(String str)
    {
        this.str = str;
    }

    public String Getter()
    {
        return str;
    }

    public void Setter(String str)
    {
        this.str = str;
    }
    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        WrapperString that = (WrapperString) o;

        return str != null ? str.equals(that.str) : that.str == null;
    }
    @Override
    public int hashCode()
    {
        return str != null ? str.hashCode() : 0;
    }
    @Override
    public String toString()
    {
        return "WrapperString{" + "str='" + str + '\'' + '}';
    }

    public String replace(char oldchar, char newchar)
    {
        return str.replace(oldchar, newchar);
    }

    public String delete(char newchar)
    {
        char empty = 0;
        return str.replace(newchar, empty);
    }
}
