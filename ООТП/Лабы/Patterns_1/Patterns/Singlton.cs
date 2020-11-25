//передавать value в конструктор


using System;
using System.Threading.Tasks;


namespace Patterns
{ 
    class Singlton
    {
        private static Singlton inctance;

        private static readonly object locker = new object();

        private Singlton() { }

        public static Singlton getInctance(string value)
        {
            if (inctance == null)
            {
                #region
                lock (locker)
                {
                    if (inctance == null)
                    {
                        inctance = new Singlton();
                        inctance.value = value;
                    }
                }
                #endregion

                //inctance = new Singlton();
                //inctance.value = value;
            }
            return inctance;
        }

        public string value { get; set; }
    }

}
