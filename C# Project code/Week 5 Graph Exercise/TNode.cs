using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DSATrees
{
    public class TNode<T> : IComparable<TNode<T>> where T : class, IComparable
    {
        public T Value { get; set; }

        public List<TNode<T>> children = new List<TNode<T>>();

        public TNode()
        {
            
        }

        public TNode(T value)
        {
            this.Value = value;
        }

        public TNode(T value,
                List<TNode<T>> children)
        {
            this.Value = value;
            this.children = children;
        }


        public TNode(T value,
                        List<T> children)
        {
            this.Value = value;
            if (children != null)
            {
                foreach (var p in children)
                {
                    this.children.Add(new TNode<T>(p, new List<T>()));
                }
            }
        }

        // We need to be able to compare two generic nodes against each other based on their values
        // Each generic node must implement a IComparable CompareTo method
        // The example uses strings as the base class and has this built in
        public int CompareTo(TNode<T> other)
        {
            if(this.Value.CompareTo(other.Value) == 0) return 0;
            else return -1;
        }

        


        
        
       
    }
}
