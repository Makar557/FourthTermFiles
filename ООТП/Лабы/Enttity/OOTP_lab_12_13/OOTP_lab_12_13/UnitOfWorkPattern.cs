using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_12_13
{
    public class UnitOfWorkPattern : IDisposable
    {
        private DbContext db = new DbContext("DbConnection");

        Repository<Person> persons;
        public Repository<Person> Persons
        {
            get
            {
                if (persons == null)
                    persons = new Repository<Person>(db);
                return persons;
            }
        }

        Repository<PersonInfo> personsInfo;
        public Repository<PersonInfo> PersonsInfo
        {
            get
            {
                if (personsInfo == null)
                    personsInfo = new Repository<PersonInfo>(db);
                return personsInfo;
            }
        }

        public void Save()
        {
            db.SaveChanges();
        }


        private bool disposed = false;
        public void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    db.Dispose();
                }
                this.disposed = true;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

    }
}
