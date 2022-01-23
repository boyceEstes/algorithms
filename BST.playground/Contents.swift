import UIKit

// Binary search tree
// binary search: runway reservation system problem - basic scheduling problem
/*
 Airport with a single runway:
 need to make reservations for future plane landings
 reserve request specifies landing time t
 add t to the set r if no other landings are scheduled in k minutes
 
 - you would not insert if the constraint was violated,
 - you would otherwise
 - remove from the set R after the plane lands
 
 We would like to do all these oporation in O(log n) time
 
 ex:
 You have reservations at 37, 41.2, 49, 56.3, where k = 3 (the duration)
 53 is OK to put in
 44 is not ok
 20 is not ok (past)
 
 Unsorted list/array to handle this is that it is linear. We could insert in constant time but anywhere that we would want to check against other elements we would need to take a lot of ram time.
 
 Sorted array: Binary search would find a bad insert. Find smallest i such that r[i] > t in O(log n) time. Compare R[i] and R[i-1] against t in O(1). However the actual insertion requires shifting of everything after O(n) time.
 
 Sorted List:
 - It inserts in O(1) time, but cannot do binary search on a list to find the correct area quickly
 
 Heaps (min/max): look at the min(or max) element and it has to be root. If there's an element in the heap that is <= k or >= k from t, O(n) time. This is just an array that you visualize as a tree
    What is a min heap? You have root be the minimum. To insert add to the end of the min heap and then you swap the root if it is less.
 
 Dictionaries and HashTables have the same problem
 
 
 
 Binary search trees are trying to create a Sorted List that can be inserted into quickly.
 - Each node needs a parent, left, and right
 - O(h) where h is the height of the tree.
 
        30
    17      40
 14     20
 
 
 */
// conventional method
class Node {
    var parent: Node?
    var left: Node?
    var right: Node?
    
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}


// indirect enumerations are for value types that have indeterminable size. Since it is referring to itself in its associated value, this needs to be done for BST as it is recursive.
// This makes the enum hold references to its associated values rather than actual values. Reference have a constant size so you no longer have the previous problem
enum BST <T: Comparable>{
    case empty
    indirect case node(BST, T, BST)
    
    // this does not work because copy-on-write, every time this function is called and a recursive
    // call is made, a new copy of the child is created is created. Because of this it will never be
    // linked to the old copy
    
    mutating func naiveInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
        
        
//        switch self {
//        case .node(var left, var value, var right):
//            if value > newValue {
//                self = right.naiveInsert(newValue: newValue)
//            } else {
//                self = left.naiveInsert(newValue: newValue)
//            }
//            break
//        case .empty:
//            self = .node(.empty, newValue, .empty)
//        }
        
    }
    
    // Ayyeeee this works. sort of. It will go to the end of the tree before inserting
    private func newTreeWithInsertedValue(newValue: T) -> BST {
        guard case .node(let left, let value, let right) = self else {
            return .node(.empty, newValue, .empty)
        }
        
        if newValue < value {
            return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
        } else {
            return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    func traverseInOrder(process: @escaping (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    
    func distanceBetweenTwoNodes(value1: T, value2: T) -> Int? {
        if nodeExists(value1: value1) && nodeExists(value1: value2){
            guard let lca = leastCommonAncestor(value1: value1, value2: value2) else {
                print("Tree is empty")
                return nil
            }
            
            guard let distToLCA = distanceToNode(value1: lca),
                let distToValue1 = distanceToNode(value1: value1),
                let distToValue2 = distanceToNode(value1: value2)
                else {
                print("Something went wrong. Could not find value1, value2 or lca.")
                return nil
            }
            
            return distToValue1 + distToValue2 - (2*distToLCA)
        } else {
            print("value1 or value2 are not in the tree")
            return nil
        }
    }
    
    
    private func nodeExists(value1: T) -> Bool {
        switch self {
        case .empty:
            return false
        case let .node(left, value, right):
            if value == value1 {
                return true
            } else {
                return left.nodeExists(value1: value1) || right.nodeExists(value1: value1)
            }
        }
    }
    
    
    // If the value does not exist, it will return nil
    private func distanceToNode(value1: T) -> Int? {
        switch self {
        case .empty:
            // if this is called we got to the end without finding it
            return nil
        case let .node(left, value, right):
            if value < value1 {
                // search right
                let rightDistance = right.distanceToNode(value1: value1)
                return rightDistance != nil ? rightDistance! + 1 : nil
            } else if value > value1 {
                // search left
                let leftDistance = left.distanceToNode(value1: value1)
                return leftDistance != nil ? leftDistance! + 1 : nil
            } else {
                return 0
            }
        }
    }
    
    
    func leastCommonAncestor(value1: T, value2: T) -> T? {
        // This only works with the assumption that both values are in the tree
        guard case let .node(left, value, right) = self else {
            return nil
        }
        
        print("Me! \(value)")
        
        if value < value1 && value < value2 {
            return right.leastCommonAncestor(value1: value1, value2: value2)
        }
        
        if value > value1 && value > value2 {
            return left.leastCommonAncestor(value1: value1, value2: value2)
        }
        
        return value
    }
}

extension BST: CustomStringConvertible {
    var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

// leaf nodes
let node5 = BST.node(.empty, "5", .empty)
let nodeA = BST.node(.empty, "a", .empty)
let node10 = BST.node(.empty, "10", .empty)
let node4 = BST.node(.empty, "4", .empty)
let node3 = BST.node(.empty, "3", .empty)
let nodeB = BST.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BST.node(nodeA, "-", node10)
let timesLeft = BST.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BST.node(.empty, "-", node4)
let divide3andB = BST.node(node3, "/", nodeB)
let timesRight = BST.node(minus4, "*", divide3andB)

// root node
let tree = BST.node(timesLeft, "+", timesRight)

print(tree)
print()
print()
var binaryTree: BST<Int> = .empty
binaryTree.insert(newValue: 5)
print(binaryTree)
binaryTree.insert(newValue: 7) // binaryTree is unchanged
print(binaryTree)
binaryTree.insert(newValue: 9) // binaryTree is unchanged
print(binaryTree)
binaryTree.insert(newValue: 8)
print(binaryTree)
binaryTree.insert(newValue: 3)
binaryTree.insert(newValue: 2)
binaryTree.insert(newValue: 4)

binaryTree.traverseInOrder() {
    print($0)
}
//binaryTree.distanceBetweenTwoNodes(value1: 1, value2: 8)
//print(binaryTree.distanceToNode(value1: 20))

print(binaryTree.distanceBetweenTwoNodes(value1: 2, value2: 8))
