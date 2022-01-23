import UIKit

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func printNodes(at root: Node?) {
    var tmp: Node? = root
    while let node = tmp {
        print("node: \(node.data) ", terminator: "~> ")
        tmp = node.next
    }
    print()
}

var node5 = Node(5)
var node4 = Node(4, next: node5)
var node3 = Node(3, next: node4)
var node2 = Node(2, next: node3)
var node1 = Node(1, next: node2)

printNodes(at: node1)
