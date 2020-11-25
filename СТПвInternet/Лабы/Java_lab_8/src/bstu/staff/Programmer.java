package bstu.staff;
import bstu.Employee.Employee;

public class Programmer extends Employee
{
    public enum Qualification {junior, middle, senior};
    protected Qualification qualification;

    public Programmer(String name, int age, float salary, Qualification qualification) throws Exception
    {
        super(name, age, salary);
        this.qualification = qualification;
    }

    public Qualification getQualification() { return qualification; }
    public void setQualification(Qualification qualification) { this.qualification = qualification; }

    @Override
    public String toString()
    {
        return "Programmer:: name: " + this.name + ", age: " + this.age + ", qualification: " + this.qualification + ", salary: " + this.salary + '.';
    }
}
