import UIKit

/* Enum implementation */
enum NodeEnum {
    case NoneEnum(Int)
    indirect case left(Int, Node)
    indirect case right(Int, Node)
    indirect case both(Int, Node, Node)
}

/* Class implementation */
class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(key: Int, left: Node? = nil, right: Node? = nil) {
        self.key = key
        self.left = left
        self.right = right
    }
    
    // We don't need a tree class to search! we can do it right from node!
    // This is marked private as we don't want to use it, really just an example.
    // we will use the binary tree class to do our searching
    private func search(key: Int) -> Node? {
        print("check if \(self.key) == \(key) : \(self.key==key)")
        if self.key == key {
            return self
        }
        
        if self.key < key {
            print("Key is greater than key. Right Object? \(right == nil ? "nil" : "YES")")
            return right?.search(key: key)
        }
        print("Key is less than or equal to key. Left Object? \(left == nil ? "nil" : "YES")")
        return left?.search(key: key)
    }
}


class BinaryTree {
    var root: Node?
    
    init(root: Node? = nil) {
        self.root = root
    }
}


let node2 = Node(key: 10, left: nil, right: nil)
let node3 = Node(key: 14, left: nil, right: node4)
let node4 = Node(key: 18, left: nil, right: nil)
let root = Node(key: 12, left: node2, right: node3)

