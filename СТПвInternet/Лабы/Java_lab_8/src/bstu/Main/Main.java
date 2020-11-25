package bstu.Main;
import bstu.Employee.Employee;
import bstu.staff.*;
import java.util.logging.Logger;

public class Main
{
    private static final Logger logger = Logger.getLogger(Main.class.getName());

    public static void main(String[] args)
    {
        try
        {
            logger.info("Creating instance of type Director");
            Director director = new Director("Petr", 45, 3500);

            logger.info("Adding 3 instances of type Engineer to the staff.");
            director.getStaff().add(new Engineer("Petya", 25, 700));
            director.getStaff().add(new Engineer("Vasya", 19, 850));
            director.getStaff().add(new Engineer("Vasya", 19, 850));

            logger.info("Adding 2 instances of type SysAdmin to the staff.");
            director.getStaff().add(new SysAdmin("Vanya", 32, 1900));
            director.getStaff().add(new SysAdmin("Andrey", 28, 1300));

            logger.info("Adding 5 instances of type Programmer to the staff(2 juniors, 1 middle, 2 senior).");
            director.getStaff().add(new Programmer("Ilya", 22, 550, Programmer.Qualification.junior));
            director.getStaff().add(new Programmer("Max", 18, 600, Programmer.Qualification.junior));
            director.getStaff().add(new Programmer("Vitalya", 23, 600, Programmer.Qualification.middle));
            director.getStaff().add(new Programmer("Artem", 30, 2700, Programmer.Qualification.senior));
            director.getStaff().add(new Programmer("Dima", 22, 3200, Programmer.Qualification.senior));

            logger.info("Call to the method 'director.countStaff()'");
            System.out.println("Count of staff: "+director.countStaff());

            logger.info("Call to the method 'director.sortStaffBySalary()' and iterating over returned elems in foreach");
            for (Employee el: director.sortStaffBySalary())
                System.out.println(el.toString());

            System.out.println("-----------------------------------------------------");
            logger.info("Call to the method 'director.getStaffWithSkill(staffSkills.Programmer_junior)' and iterating over returned elems in foreach");
            for (Employee el: director.getStaffWithSkill(staffSkills.Programmer_junior))
                System.out.println(el.toString());
        }
        catch(Exception ex)
        {
            logger.warning("Shit happened: "+ ex.getMessage());
            System.out.println(ex.getMessage());
        }
    }
}
