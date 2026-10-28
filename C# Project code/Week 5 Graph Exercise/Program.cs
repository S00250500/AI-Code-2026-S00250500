using System;
using System.Collections.Generic;
using System.Linq;
using DSATrees;

internal class Program
{
    private static void Main()
    {
        // Build the graph with the supplied TNode class.
        var a = new TNode<string>("A");
        var b = new TNode<string>("B");
        var c = new TNode<string>("C");
        var d = new TNode<string>("D");
        var e = new TNode<string>("E");
        var f = new TNode<string>("F");
        var gFromE = new TNode<string>("G");
        var gFromC = new TNode<string>("G");

        a.children.Add(b);
        a.children.Add(c);

        b.children.Add(d);
        b.children.Add(e);
        d.children.Add(b);       // Back edge D -> B, as shown in the diagram.
        e.children.Add(gFromE);  // Goal reached through B.

        c.children.Add(f);
        c.children.Add(gFromC);  // Goal reached directly through C.

        var tree = new GenericTree<string> { Root = a };
        var goal = new TNode<string>("G");

        Console.WriteLine("Depth-first search:");
        var dfsPath = tree.dfs(
            tree.Root,
            new Stack<TNode<string>>(),
            new Stack<TNode<string>>(),
            new List<TNode<string>>(),
            goal);

        if (dfsPath == null)
            Console.WriteLine("No path to G was found.");
        else
            Console.WriteLine(string.Join(" -> ", dfsPath.Reverse().Select(node => node.Value)));

        Console.WriteLine("\nBreadth-first search:");
        var initialPaths = new Queue<List<TNode<string>>>();
        initialPaths.Enqueue(new List<TNode<string>> { tree.Root });
        var bfsPath = tree.bfs(initialPaths, goal);

        if (bfsPath == null)
            Console.WriteLine("No path to G was found.");
        else
            Console.WriteLine(string.Join(" -> ", bfsPath.Select(node => node.Value)));
    }
}
