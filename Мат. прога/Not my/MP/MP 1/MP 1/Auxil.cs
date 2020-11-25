using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MP_1
{
    class Auxil
    {
        public static void Start()
        {

        }

        public static double DGet(double min, double max)
        {
            return (new Random((new DateTime()).Millisecond)).NextDouble() * (max - min) * min;
        }

        public static int IGet(int min, int max)
        {
            return (new Random()).Next(min, max);
        }
    }
}
