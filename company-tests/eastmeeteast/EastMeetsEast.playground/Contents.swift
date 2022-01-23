import UIKit

var str = "Hello, playground"

if let zero = Int("0") { print(zero) }
print(Int("2A") as Any)
print(Int("a") as Any)


//SELECT a.name,


//remove item from linked list

class Node {
    var name: String = ""
    var next: Node?
    
    init(_ name: String, next: Node? = nil) {
        self.name = name
        self.next = next
    }
}



func printNode(_ node: Node) {
    var tmp: Node? = node
    while let node = tmp {
        print("\(node.name)", terminator: "->")
        tmp = node.next
    }
    print("\n")
}


func remove(_ node: Node, _ index: Int, _ reverse: Bool = false) -> Node {
    var tmp = node
    var count = 0
    while let node = node.next {
        if count == index {
            print("found index!")
            let curNode = node
            
            if let newNext = curNode.next {
                curNode.next = newNext
            }
        } else {
            count += 1
            print("count: \(count)")
        }
    }
    
    return tmp
}

var nodeE = Node("E")
var nodeD = Node("D",next: nodeE)
var nodeC = Node("C", next: nodeD)
var nodeB = Node("B", next: nodeC)
var nodeA = Node("A", next: nodeB)
var root = nodeA
printNode(root)



printNode(remove(root, 0))
