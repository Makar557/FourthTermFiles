package ex.UnitTests.staff;

import ex.UnitTests.Employee.Employee;
import java.util.ArrayList;

interface IDirector
{
    int countStaff();
    ArrayList<Employee> sortStaffBySalary();
    ArrayList<Employee> getStaffWithSkill(staffSkills skill);
}

public class Director extends Employee implements IDirector
{
    private ArrayList<Employee> staff;

    public Director(String name, int age, float salary)  throws Exception
    {
        super(name, age, salary);
        this.staff = new ArrayList<Employee>();
    }

    @Override
    public String toString()
    {
        return "Director:: name: " + this.name + ", age: " + this.age + ", salary: " + this.salary + '.';
    }

    @Override
    public int countStaff() { return staff.size(); }

    @Override
    public ArrayList<Employee> sortStaffBySalary()
    {
        int sortedSize = 0;
        Employee tempEl;
        for (int i = 0; i < staff.size(); ++i)
        {
            for (int j = sortedSize; j>0 && staff.get(j).getSalary() < staff.get(j-1).getSalary(); --j)
            {
                if(staff.get(j).getSalary() < staff.get(j-1).getSalary())
                {
                    tempEl = staff.get(j);
                    staff.set(j, staff.get(j-1));
                    staff.set(j-1, tempEl);
                }
            }
            sortedSize++;
        }

        return staff;
    }

    @Override
    public  ArrayList<Employee> getStaffWithSkill(staffSkills skill)
    {
        ArrayList<Employee> res = new ArrayList<Employee>();
        switch (skill)
        {
            case Engineer:
            {
                for(Employee el : staff)
                    if(el instanceof Engineer)
                        res.add(el);
                break;
            }
            case Programmer_junior:
            {
                for(Employee el : staff)
                    if(el instanceof Programmer && ((Programmer) el).getQualification() == Programmer.Qualification.junior)
                        res.add(el);
                break;
            }
            case Programmer_middle:
            {
                for(Employee el : staff)
                    if(el instanceof Programmer && ((Programmer) el).getQualification() == Programmer.Qualification.middle)
                        res.add(el);
                break;
            }
            case Programmer_senior:
            {
                for(Employee el : staff)
                    if(el instanceof Programmer && ((Programmer) el).getQualification() == Programmer.Qualification.senior)
                        res.add(el);
                break;
            }
            case SysAdmin:
            {
                for(Employee el : staff)
                    if(el instanceof SysAdmin)
                        res.add(el);
                break;
            }
        }

        return res;
    }

    public ArrayList<Employee> getStaff() { return staff; }
    public void setStaff(ArrayList<Employee> staff) { this.staff = staff; }
}
