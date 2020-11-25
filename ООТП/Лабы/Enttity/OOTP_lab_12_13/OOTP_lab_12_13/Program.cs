using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_12_13
{
    class Program
    {
        static void Main(string[] args)
        {
            using (DBContext db = new DBContext())
            {
                Person person1 = new Person { FirstName = "Вася" };
                Person person2 = new Person { FirstName = "Петя" };
                Person person3 = new Person { FirstName = "Стёпа" };
                db.Persons.AddRange(new List<Person> { person1, person2, person3 });
                db.SaveChanges();

                PersonInfo personInfo1 = new PersonInfo { Id = person1.Id, Age = 22, Weight = 74, Height = 182 };
                PersonInfo personInfo2 = new PersonInfo { Id = person2.Id, Age = 13, Weight = 52, Height = 164 };
                PersonInfo personInfo3 = new PersonInfo { Id = person3.Id, Age = 18, Weight = 81, Height = 172 };
                db.PersonsInfo.AddRange(new List<PersonInfo> { personInfo1, personInfo2, personInfo3 });
                db.SaveChanges();

                foreach (Person pers in db.Persons.Include("Info").ToList())
                    Console.WriteLine($"Name: {pers.FirstName}  \n" +
                                     $"Age: {pers.Info.Age}  \n" +
                                     $"Weight: {pers.Info.Weight}  Height: {pers.Info.Height}\n");
                Console.ReadKey();
            }

            using (DBContext db = new DBContext())
            {
                Person person = db.Persons.Include("Info").FirstOrDefault(p => p.Info.Weight > 10);
                if (person != null)
                {
                    person.FirstName = "TestName";
                    db.Entry(person).State = EntityState.Modified;
                    db.SaveChanges();
                }

                PersonInfo personInfo = db.PersonsInfo.Include("Person").FirstOrDefault(p => p.Person.FirstName == "Вася");
                if (personInfo != null)
                {
                    personInfo.Weight = 25;
                    db.Entry(personInfo).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }

            using (DBContext db = new DBContext())
            {
                Person p1 = db.Persons.Include("Info").FirstOrDefault();
                if (p1 != null && p1.Info!=null)
                {
                    db.PersonsInfo.Remove(p1.Info);
                    db.Persons.Remove(p1);
                    db.SaveChanges();
                }

                PersonInfo personInfo = db.PersonsInfo.Include("Person").FirstOrDefault(p => p.Person.FirstName == "Петя");
                if (personInfo != null)
                {
                    db.PersonsInfo.Remove(personInfo);
                    db.SaveChanges();
                }
            }





            using (UnitOfWorkPattern db = new UnitOfWorkPattern())
            {
                Person person1 = new Person { FirstName = "Вася" };
                Person person2 = new Person { FirstName = "Петя" };
                Person person3 = new Person { FirstName = "Стёпа" };

                PersonInfo personInfo1 = new PersonInfo { Id = person1.Id, Age = 22, Weight = 74, Height = 182 };
                PersonInfo personInfo2 = new PersonInfo { Id = person2.Id, Age = 13, Weight = 52, Height = 164 };
                PersonInfo personInfo3 = new PersonInfo { Id = person3.Id, Age = 18, Weight = 81, Height = 172 };

                db.Persons.Add(person1);
                db.Persons.Add(person2);
                db.Persons.Add(person3);

                db.PersonsInfo.Add(personInfo1);
                db.PersonsInfo.Add(personInfo2);
                db.PersonsInfo.Add(personInfo3);

                db.Save();
            }
        }
    }
}
