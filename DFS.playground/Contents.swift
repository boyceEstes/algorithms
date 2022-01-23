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

func dfsVisit<T> (start: Node<T>, adj: [Node<T>: [Node<T>]])
