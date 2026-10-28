using System;
using System.Collections.Generic;
using System.Linq;

namespace DSATrees
{
    public class GenericTree<T> where T : class, IComparable
    {
        private TNode<T> root;

        public TNode<T> Root
        {
            get => root;
            set => root = value;
        }

        public bool GoalFound = false;

        public GenericTree()
        {
        }

        public bool simplex_dfs(
            TNode<T> node,
            TNode<T> Goal,
            List<TNode<T>> visited,
            List<TNode<T>> solution)
        {
            visited.Add(node);

            if (Goal.CompareTo(node) == 0)
                return true;
            else if (node.children.Count > 0)
            {
                foreach (var child in node.children)
                {
                    solution.Add(child);

                    if (simplex_dfs(child, Goal, visited, solution))
                        return true;
                    else
                        solution.Remove(child);
                }
            }

            return false;
        }

        /*
         * Current is the node currently being visited.
         * Path is the current path to that node.
         * frontier is retained from the original method signature.
         * visited prevents cycles.
         * Goal is the node we are looking for.
         */
        public Stack<TNode<T>>? dfs(
            TNode<T> Current,
            Stack<TNode<T>> Path,
            Stack<TNode<T>> frontier,
            List<TNode<T>> visited,
            TNode<T> Goal)
        {
            // Stop safely if there is no current node.
            if (Current == null)
                return null;

            // Check if the current node is the goal.
            if (Current.CompareTo(Goal) == 0)
            {
                Path.Push(Current);
                return Path;
            }

            // Do not revisit a node that has already been explored.
            if (visited.Contains(Current))
                return null;

            visited.Add(Current);
            Path.Push(Current);

            // Explore each child in depth-first order.
            foreach (var child in Current.children)
            {
                var result = dfs(
                    child, Path, frontier, visited, Goal);

                if (result != null)
                    return result;
            }

            // No solution was found through this branch.
            // Remove the current node when backtracking.
            Path.Pop();
            return null;
        }

        public List<TNode<T>>? bfs(
            Queue<List<TNode<T>>> Paths,
            TNode<T> Goal)
        {
            // No paths left means the goal cannot be reached.
            if (Paths.Count == 0)
                return null;

            // Check the last node of the oldest path.
            if (Paths.Peek().Last().CompareTo(Goal) == 0)
                return Paths.Dequeue();

            // Extend the oldest path in the queue.
            List<List<TNode<T>>> nodes = extendPaths(Paths);

            // Add new paths to the back of the FIFO queue.
            foreach (var extension in nodes)
                Paths.Enqueue(extension);

            return bfs(Paths, Goal);
        }

        public List<List<TNode<T>>> extendPaths(
            Queue<List<TNode<T>>> Paths)
        {
            List<List<TNode<T>>> extendedPaths =
                new List<List<TNode<T>>>();

            if (Paths.Count > 0)
            {
                // Remove the oldest path from the queue.
                List<TNode<T>> nodes = Paths.Dequeue();

                // The last node is the one we need to extend.
                TNode<T> node = nodes.Last();

                if (node.children.Count > 0)
                {
                    foreach (var child in node.children)
                    {
                        // Do not revisit a node already on this path.
                        if (!nodes.Contains(child))
                        {
                            // Copy the existing path.
                            List<TNode<T>> clone =
                                new List<TNode<T>>(nodes);

                            // Add the new child to the copied path.
                            clone.Add(child);

                            // Store the new candidate path.
                            extendedPaths.Add(clone);
                        }
                    }
                }
            }

            return extendedPaths;
        }

        public void TraverseAcrossTree(TNode<T> node)
        {
            Console.WriteLine(
                "Parent Node {0}", node.Value.ToString());

            if (node.children != null)
            {
                foreach (var item in node.children)
                {
                    Console.WriteLine(
                        $"{item.Value.ToString()} is a child of " +
                        $"{node.Value.ToString()}");
                }

                foreach (var item in node.children)
                {
                    TraverseAcrossTree(item);
                }
            }
        }

        public TNode<T> Find(
            TNode<T> current,
            Stack<TNode<T>> frontier,
            TNode<T> other)
        {
            if (current != null)
            {
                if (current.CompareTo(other) == 0)
                {
                    return current;
                }
                else if (current.children.Count() > 0)
                {
                    foreach (var node in current.children)
                        frontier.Push(node);
                }

                // Check the children of the current node first.
                if (frontier.Count > 0)
                {
                    return Find(frontier.Pop(), frontier, other);
                }
            }

            return Find(frontier.Pop(), frontier, other);
        }

        public TNode<T> InsertAfter(TNode<T> node, T child)
        {
            TNode<T> found = Find(
                root, new Stack<TNode<T>>(), node);

            if (found != null)
            {
                TNode<T> newNode =
                    new TNode<T>(child, new List<T>());

                found.children.Add(newNode);
                return newNode;
            }

            return null;
        }
    }
}
