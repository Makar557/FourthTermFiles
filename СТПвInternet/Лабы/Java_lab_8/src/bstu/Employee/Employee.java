package bstu.Employee;

public abstract class Employee
{
    protected String name;
    protected int age;
    protected float salary;

    public Employee(String name, int age, float salary) throws Exception
    {
        if(name == null || name == "" )
            throw new Exception("uncorrect name");

        if(age < 18)
            throw new Exception("person " + name + " can't work with us, becouse of his age(less then 18)");

        this.name = name;
        this.age = age;
        this.salary = salary;
    }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public float getSalary() {  return salary; }
    public void setSalary(float salary) { this.salary = salary; }
}
