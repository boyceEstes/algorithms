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


func insertNode(for root: Node, data: Int, position: Int) -> Node {
    let newNode = Node(data)
    var currentIndex = 0
    var tmpNode: Node? = root
    
    if position == 0 {
        newNode.next = root
        return newNode
    }
    
    while let node = tmpNode {
        if currentIndex+1 == position {
            if let next = node.next {
                node.next = newNode
                newNode.next = next
            }
        }
        currentIndex += 1
        tmpNode = node.next
    }
    
    return root
}


//var node5 = Node(5)
//var node4 = Node(4, next: node5)
var node3 = Node(14)
var node2 = Node(20, next: node3)
var node1 = Node(18, next: node2)
var root = node1
printNodes(at: root)
root = insertNode(for: node1, data: 41, position: 0)
printNodes(at: root)
