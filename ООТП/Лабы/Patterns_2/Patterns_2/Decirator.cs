using System;

namespace Patterns_2
{
    abstract class Pizza
    {
        public string nameOfPizza { get; protected set;}
        public Pizza(string _name)
        {
            nameOfPizza = _name;
        }
        public abstract int GetCost();
    }

    class BelarussianPizza : Pizza
    {
        public BelarussianPizza():base("Belarussian pizza") { }

        public override int GetCost()
        {
            return 7;
        }
    }
    class ItalianPizza : Pizza
    {
        public ItalianPizza() : base("Italian pizza") { }

        public override int GetCost()
        {
            return 10;
        }
    }

    abstract class PizzaDecoratoc : Pizza
    {
        protected Pizza pizza;
        public PizzaDecoratoc(string _name, Pizza _pizza) : base(_name)
        {
            pizza = _pizza;
        }
        public abstract void PrintPizza();
    }
    class CheesePizza : PizzaDecoratoc
    {
        public CheesePizza(Pizza piz) : base(piz.nameOfPizza + ", with cheese", piz) { }
        public override int GetCost()
        {
            return pizza.GetCost() + 1;
        }
        public override void PrintPizza()
        {
            Console.WriteLine($"I'm a {pizza.nameOfPizza} with cheese.");
        }
    }
    class MushroomsPizza : PizzaDecoratoc
    {
        public MushroomsPizza(Pizza piz) : base(piz.nameOfPizza + ", with mushrooms", piz) { }
        public override int GetCost()
        {
            return pizza.GetCost() + 3;
        }
        public override void PrintPizza()
        {
            Console.WriteLine($"I'm a {pizza.nameOfPizza} with mmushrooms.");
        }
    }




}