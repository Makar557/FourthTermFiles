using System;
using System.Collections.Generic;

namespace Patterns_2
{
    public abstract class Component
    {
        protected string name;
        public Component(string _name)
        {
            name = _name;
        }
        public virtual void AddComponent(Component _component) { }
        public virtual void AddComponent(params Component[] paramsList) { }
        public virtual void RemoveComponent(Component _component) { }
        public virtual void RemoveComponent(params Component[] paramsList) { }
        public virtual void PrintComponentName()
        {
            Console.WriteLine(name);
        }
    }

    public class Folder : Component
    {
        private List<Component> components = new List<Component>();

        public Folder(string _name) : base(_name) { }

        public override void AddComponent(Component _component)
        {
            components.Add(_component);
        }
        public override void AddComponent(params Component[] paramsList)
        {
            foreach(Component _comp in paramsList)
            {
                components.Add(_comp);
            }
        }
        public override void RemoveComponent(Component _component)
        {
            components.Remove(_component);
        }
        public override void RemoveComponent(params Component[] paramsList)
        {
            foreach (Component _comp in paramsList)
            {
                components.Remove(_comp);
            }
        }
        public override void PrintComponentName()
        {
            Console.WriteLine("Folder name: " + name);
            foreach(Component comp in components)
            {
                comp.PrintComponentName();
            }
        }
    }
    public class File : Component
    {
        public File(string _name) : base(_name) { }
    }













}