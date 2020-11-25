using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab_12_13
{
    public class PersonInfo
    {
        [Key]
        [ForeignKey("Person")]
        public int Id { get; set; }

        public int Weight { get; set; }
        public int Height { get; set; }
        public int Age { get; set; }

        public Person Person { get; set; }
    }
}
