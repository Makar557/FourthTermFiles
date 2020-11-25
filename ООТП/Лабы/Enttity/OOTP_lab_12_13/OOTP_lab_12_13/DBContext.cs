using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lab_12_13
{
    class DBContext : DbContext
    {
        public DBContext() : base("DbConnection") { }

        public DbSet<Person> Persons { get; set; }
        public DbSet<PersonInfo> PersonsInfo { get; set; }
    }
}
