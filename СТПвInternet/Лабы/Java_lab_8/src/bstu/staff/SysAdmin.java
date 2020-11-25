package bstu.staff;
import bstu.Employee.Employee;

public class SysAdmin extends Employee
{
    public SysAdmin(String name, int age, float salary)  throws Exception
    {
        super(name, age, salary);
    }

    @Override
    public String toString()
    {
        return "SysAdmin:: name: " + this.name + ", age: " + this.age + ", salary: " + this.salary + '.';
    }
}
