//не писать this

using System;
using System.Collections.Generic;

namespace Patterns
{
    public interface ICook
    {
        void AddCucumbers();
        void AddTomatoes();
        void AddCabbage();
        void AddSaladDressing();
    }

    public class WorldOfSalads : ICook
    {
        private Salad salad = new Salad();

        public WorldOfSalads()
        {
            this.Reset();
        }
        public void Reset()
        {
            this.salad = new Salad();
        }
        public void AddCucumbers()
        {
            this.salad.Add("cucumbers");
        }
        public void AddTomatoes()
        {
            this.salad.Add("tomatoes");
        }
        public void AddCabbage()
        {
            this.salad.Add("cabbage");
        }
        public void AddSaladDressing()
        {
            this.salad.Add("salad dressing");
        }

        public Salad GetSalad()
        {
            Salad result = this.salad;
            return result;
        }
    }

    public class Salad
    {
        private List<object> ingredients = new List<object>();

        public void Add(string _ingredient)
        {
            this.ingredients.Add(_ingredient);
        }
        public string PrintIngredients()
        {
            string str = string.Empty;
            
            for(int i=0; i<this.ingredients.Count; i++)
            {
                str += this.ingredients[i] + ", ";
            }

            str = str.Remove(str.Length - 3);

            return "Salad composition: " + str + "\n";
        }
    }
    public class MainCook
    {
        private ICook newSalad;
        public ICook NewSalad
        {
            set { newSalad = value; }
        }
        public void FullVegetableSalad()
        {
            this.newSalad.AddCabbage();
            this.newSalad.AddCucumbers();
            this.newSalad.AddTomatoes();
            this.newSalad.AddSaladDressing();
        }
        public void TomatoesAndCucumberd()
        {
            this.newSalad.AddCucumbers();
            this.newSalad.AddTomatoes();
            this.newSalad.AddSaladDressing();
        }
        public void CabbageAndCucumbers()
        {
            this.newSalad.AddCabbage();
            this.newSalad.AddCucumbers();
            this.newSalad.AddSaladDressing();
        }

    }
}