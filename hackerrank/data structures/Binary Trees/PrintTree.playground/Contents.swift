import UIKit

class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int, left: Node? = nil, right: Node? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

func printNodesPreOrder(at root: Node?) {
    if root == nil {
        return
    }
    print("\(root!.data)", terminator: " ")
    printNodesPreOrder(at: root!.left)
    printNodesPreOrder(at: root!.right)
}


func printNodesInOrder(at root: Node?) {
    if let curRoot = root {
        printNodesInOrder(at: curRoot.left)
        print("\(root!.data)", terminator: " ")
        printNodesInOrder(at: curRoot.right)
    } else {
        return
    }
}


func printNodesPostOrder(at root: Node?) {
    if root == nil {
        return
    }
    
    printNodesPostOrder(at: root!.left)
    printNodesPostOrder(at: root!.right)
    print("\(root!.data)", terminator: " ")
}

let node6 = Node(6)
let node4 = Node(4)
let node3 = Node(3, right: node4)
let node5 = Node(5, left: node3, right: node6)
let node2 = Node(2, right: node5)
let node1 = Node(1, right: node2)

printNodesInOrder(at: node1)
