using System;

namespace Patterns_3
{
    class TV
    {
        public void On()
        {
            Console.WriteLine("TV is on!");
        }
        public void Off()
        {
            Console.WriteLine("TV is off!");
        }
    }

    interface ICommand
    {
        void Execute();
        void Undo();
    }

    class TVOnCommand : ICommand
    {
        TV tv;
        public TVOnCommand(TV _tvSet)
        {
            tv = _tvSet;
        }
        public void Execute()
        {
            tv.On();
        }
        public void Undo()
        {
            tv.Off();
        }
    }

    class Pult
    {
        ICommand command;
        public Pult() { }
        public void SetCommand(ICommand _command)
        {
            command = _command;
        }
        public void PressButton()
        {
            if(command!=null)
                command.Execute();
        }
        public void PressUndo()
        {
            if (command != null)
                command.Undo();
        }
    }
}