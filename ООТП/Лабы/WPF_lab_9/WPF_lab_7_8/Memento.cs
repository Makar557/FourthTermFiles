using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WPF_lab_7_8.Models;

namespace WPF_lab_7_8
{
    class Memento
    {
        public List<TODOEl> tasksState;

        public Memento(List<TODOEl> tasks)
        {
            tasksState = new List<TODOEl>(tasks);
        }
    }

    class AppHistory
    {
        List<Memento> states;
        int currentstateID;
        public AppHistory(List<TODOEl> tasks)
        {
            states = new List<Memento>();
            AddState(tasks);
            currentstateID = 0;
        }

        public void AddState(List<TODOEl> tasks)
        {
            states.Add(new Memento(tasks));
            currentstateID++;
        }

        public Memento Undo()
        {
            if (currentstateID > 0)
            {
                currentstateID--;
                return states[currentstateID];
            }

            return null;
        }

        public Memento Redo()
        {
            if (currentstateID < states.Count - 1)
            {
                currentstateID++;
                return states[currentstateID];
            }

            return null;
        }
    }
}
