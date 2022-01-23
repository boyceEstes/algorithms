import UIKit

struct Node<T: Hashable>: Hashable {
    let value: T
}

let nodeS = Node(value: "s")
let nodeA = Node(value: "a")
let nodeZ = Node(value: "z")
let nodeX = Node(value: "x")
let nodeC = Node(value: "c")
let nodeD = Node(value: "d")
let nodeV = Node(value: "v")
let nodeF = Node(value: "f")

let adjacencyList: [Node<String>: [Node<String>]] = [
    nodeS: [nodeA, nodeX],
    nodeA: [nodeS, nodeZ],
    nodeZ: [nodeA],
    nodeX: [nodeS, nodeD, nodeC],
    nodeD: [nodeX, nodeC, nodeF],
    nodeC: [nodeX, nodeD, nodeF, nodeV],
    nodeF: [nodeD, nodeC, nodeV],
    nodeV: [nodeC, nodeF]
]

func bfs<T> (start: Node<T>, adj: [Node<T>: [Node<T>]]) {
    var frontier: [Node<T>] = [start]
    var level: [Node<T>: Int] = [start: 0]
    var parent: [Node<T>: Node<T>?] = [start: nil]
    var i = 1

    while !frontier.isEmpty {
        var next: [Node<T>] = []
        for u in frontier {
            for v in adj[u]! {
                if level[v] == nil {
                    level[v] = i
                    parent[v] = u
                    next.append(v)
                }
            }
        }
        i+=1
        frontier = next
    }
    
    print(level)
}


bfs(start: nodeS, adj: adjacencyList)
// O(|E| * 2) on undirected graphs
// O(|E|) on directed graphs
