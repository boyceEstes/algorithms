import UIKit
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
    // there will always be at least a root so we can know the last one will always be 0,
    // for this reason we will start at -1 so it will increment to 0 in the loop
    var lastLinkedListIndex = -1
    if reverse {
        var tmp: Node? = node
        while let node = tmp {
            print("\(node.name)", terminator: "->")
            tmp = node.next
            lastLinkedListIndex += 1
        }
    }
    print("LinkedListLength: \(lastLinkedListIndex)")
    
    let prevIndex = reverse ? lastLinkedListIndex - index - 1 : index - 1
    let root = node
    var tmp: Node? = node
    var count = 0

    if prevIndex < 0 {
        if let nextNode = node.next {
            return nextNode
        }
    }
    
    while let node = tmp {
        if count == prevIndex {
            if let terminalNode = node.next {
                if let newNextNode = terminalNode.next {
                    node.next = newNextNode
                } else {
                    print("there is no new node")
                    node.next = nil
                }
            } else {
                print("there is no terminal node")
            }
            
            return root
        } else {
            count += 1
            if node.next != nil {
                tmp = node.next
            } else {
                print("we're at the end")
            }
        }
    }
    return root
}

var nodeE = Node("E")
var nodeD = Node("D",next: nodeE)
var nodeC = Node("C", next: nodeD)
var nodeB = Node("B", next: nodeC)
var nodeA = Node("A", next: nodeB)
var root = nodeA
printNode(root)

//printNode(remove(root, 0))
printNode(remove(root, 0, true))
//printNode(remove(root, 4))

