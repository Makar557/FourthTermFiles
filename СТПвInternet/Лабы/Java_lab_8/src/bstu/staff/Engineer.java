package bstu.staff;
import bstu.Employee.Employee;

public class Engineer extends Employee
{
    public Engineer(String name, int age, float salary)  throws Exception
    {
        super(name, age, salary);
    }

    @Override
    public String toString()
    {
        return "Engineer:: name: " + this.name + ", age: " + this.age + ", salary: " + this.salary + '.';
    }
}
