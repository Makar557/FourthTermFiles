//сериализация

using System;

namespace Patterns
{
    class Person
    {
        public int age { get; set; }
        public string name { get; set; }
        public Passport passportId { get; set; }

        public Person(int age, string name, int passportId)
        {
            this.age = age;
            this.name = name;
            this.passportId = new Passport(passportId);
        }

        public Person ShallowCopy()
        {
            return (Person)this.MemberwiseClone();
        }

        public Person DeepCopy()
        {
            Person clone = (Person)this.MemberwiseClone();
            clone.name = name;
            clone.age = age;
            clone.passportId = new Passport(this.passportId.passportId);
            return clone;
        }

        public class Passport
        {
            public int passportId;

            public Passport(int passportId)
            {
                this.passportId = passportId;
            }
        }
    }
}