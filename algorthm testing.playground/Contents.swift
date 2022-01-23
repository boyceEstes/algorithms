import Foundation
func generalizedGCD(num: Int, arr:[Int]) -> Int {
    var gcdPossibilities = [Int]()
    var newGcdPossibilities = [Int]()
    let sortedArr = arr.sorted()
    let minNum = sortedArr[0]

    // find the factors of minNum and add to gcdPossibilities - the gcd cannot be larger than the smallest number
    // 1 is already included, 0 doesn't count
    for i in 1...minNum {
        // divide the number by whatever - if no remainder, it is a factor
        if minNum % i == 0 {
            gcdPossibilities.append(i)
        }
    }
    newGcdPossibilities = gcdPossibilities
    // we have all possibilities
    // now remove the possibilities that do not work with our other numbers - skip the first index since we know its minNum
    for i in 1..<sortedArr.count {
        // check if any gcdPossibilities do not work for this element
        gcdPossibilities = newGcdPossibilities
        for j in 0..<gcdPossibilities.count {
            if sortedArr[i] % gcdPossibilities[j] != 0 {
                newGcdPossibilities.append(gcdPossibilities[j])
            }
        }
    }
    
    // return the max of the gcdpossibilities left
    let gcd = gcdPossibilities.max() ?? 1
    return gcd
}

print("gcd: \(generalizedGCD(num: 5, arr: [2,4,6,8,10]))")


func gcd(a: Int, b: Int) -> Int {
    if a == 0 {
        return b
    }
    return gcd(a: b % a, b: a)  // this is the crux of the algorithm. Whenever you have 3 and 6, pass in 6%3 (0) and then it will return the result (3)
}

func findGcd(arr: [Int], n: Int) -> Int {
    var result = arr[0]
    for i in 0..<n {
        result = gcd(a: arr[i], b: result)
        
        if result == 1 {
            return 1
        }
    }
    return result
}
print("gcd: \(findGcd(arr: [2,4,6,8,10], n: 5))")


//class Node<T> {
//    var data: T
//    var left: Node?
//    var right: Node?
//
//    init(data: T) {
//        self.data = data
//    }
//}

// this needs to have an indirect case since it is a recursive type and we cannot tell swift the exact size it should allocate for this enum
enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    var count: Int {
        switch self {
            case let .node(left, _, right):
                return left.count + 1 + right.count
            case .empty:
                return 0
        }
    }
    
    // enum is a value type which is immutable by default. Mutating denotes that you want to change something inside this.
    mutating func naiveInsert(newValue: T) {
        // Base case
        // check if the current node has a value. If not, create a new node here.
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return
        }
        
        // if the current node has contents: compare new value with current node value. We will use this to determine which way to go.
        if newValue < value {
            left.naiveInsert(newValue: newValue)
        } else {
            right.naiveInsert(newValue: newValue)
        }
    }
    
    mutating func insert(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
        switch self {
            // if tree is empty
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                // create a new tree with inserted value in left
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                // create a new tree with inserted value in right
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    // in-order traversal:
    // Go through the binary search tree in ascending order. left to root to right
    func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    // pre-order traversal:
    // Go through the binary search tree like: root to left to right
    func traversePreOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePreOrder(process: process)
            process(value)
            right.traversePreOrder(process: process)
        }
    }
    // pre-order traversal:
    // Go through the binary search tree like: left to right to root
    func traversePostOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
}

//struct Node<T> {
//    var data: T
//    var left: Node?
//    var right: Node?
//}

// create the tree, starting from bottom and going up.
// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let aMinus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", aMinus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

// CustomStringConvertable - defines a custom output for print statements
extension BinaryTree: CustomStringConvertible {
  var description: String {
    switch self {
    case let .node(left, value, right):
      return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
    case .empty:
      return ""
    }
  }
}

print(tree)
print(tree.count)

var tree2: BinaryTree<Int> = .empty
tree2.insert(newValue: 7)
tree2.insert(newValue: 10)
tree2.insert(newValue: 2)
tree2.insert(newValue: 1)
tree2.insert(newValue: 5)
tree2.insert(newValue: 9)

tree2.traverseInOrder { print($0) }





func closestLocations (totalCrates:Int, allLocations:[[Int]], truckCapacity:Int)->[[Int]]
{
    // Use distance formula to find the distance from truck to location
    // thought process (numbered by possible solutions):
    // 1. loop through all the points and do distance on them all to find the minimum. Keep doing this for as many as are needed to fill the truck
    // 2. reduce the allLocations array to find the minimum, remove that from the array to search. Keep doing this for as many as are needed to fill the truck
    // 3. create a custom comparable for arrays of size 2 that will tell which is smaller then just run min() for as many times as truck capacity needs.
    // 4. create a custom comparable for int arrays of size 2 that will allow us to sort the 2d array. Then filter for as many crates as the truck needs
    
    // will always have more than or equal truck capacity to crates
    // if there are no possible pairs return an empty list with empty pair... What is an impossible pair? One with more than 2 elements?
    let subsequence = allLocations.sorted(by: {
        if $0.count == 2 && $1.count == 2 && $0.self == [Int].self && $1.self == [Int].self{
            let lhsPowX = pow(Double($0[0]), Double(2))
            let lhsPowY = pow(Double($0[1]), Double(2))
            let lhsDistance = sqrt(lhsPowX + lhsPowY)
            
            let rhsPowX = pow(Double($1[0]), Double(2))
            let rhsPowY = pow(Double($1[1]), Double(2))
            let rhsDistance = sqrt(rhsPowX + rhsPowY)
            
            if lhsDistance < rhsDistance {
                // left was
                return true
            } else {
                print("right was further")
                return false
            }
        } else {
            print("throw error, usually")
            return false
        }
    }).prefix(upTo: truckCapacity)
    return Array(subsequence)
}

//extension Array: Comparable where Element == Int {
//    public static func < (lhs: Array<Element>, rhs: Array<Element>) -> Bool {
//        if lhs.count == 2 && rhs.count == 2{
//            let lhsPowX = pow(Double(lhs[0]), Double(2))
//            let lhsPowY = pow(Double(lhs[1]), Double(2))
//            let lhsDistance = sqrt(lhsPowX + lhsPowY)
//
//            let rhsPowX = pow(Double(rhs[0]), Double(2))
//            let rhsPowY = pow(Double(rhs[1]), Double(2))
//            let rhsDistance = sqrt(rhsPowX + rhsPowY)
//
//            if lhsDistance < rhsDistance {
//                print("left was further")
//                return true
//            } else {
//                print("right was further")
//                return false
//            }
//
//        } else {
//            // we are comparing more than 2 points, handle error
//            print("not 2 elements in point")
//        }
//        return false
//    }
//}

print(closestLocations(totalCrates: 3, allLocations: [[1, -3], [1, 2], [3,4]], truckCapacity: 2))

//
//
//
//enum BST<T: Comparable>: Equatable {
//    case empty
//    indirect case node(BST, T, BST)
//
//    var count: Int {
//        switch self {
//            case let .node(left, _, right):
//                return left.count + 1 + right.count
//            case .empty:
//                return 0
//        }
//    }
//
//    mutating func insert(newValue: T) {
//        self = newTreeWithInsertedValue(newValue: newValue)
//    }
//
//    private func newTreeWithInsertedValue(newValue: T) -> BST {
//        switch self {
//            // if tree is empty
//        case .empty:
//            return .node(.empty, newValue, .empty)
//        case let .node(left, value, right):
//            if newValue < value {
//                // create a new tree with inserted value in left
//                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
//            } else {
//                // create a new tree with inserted value in right
//                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
//            }
//        }
//    }
//
//    // in-order traversal:
//    // Go through the binary search tree in ascending order. left to root to right
//    func traverseInOrder(process: (T) -> ()) {
//        switch self {
//        case .empty:
//            return
//        case let .node(left, value, right):
//            left.traverseInOrder(process: process)
//            process(value)
//            right.traverseInOrder(process: process)
//        }
//    }
//
//
//    func findDistanceUtil(_ node1: Int, _ node2: Int, _ level: Int) -> BST? {
//        if root == BST.empty {
//            return nil
//        }
//
//        // if either node match the current value of the root, return the info
//        switch self {
//        case .empty:
//            print("world")
//        case let .node(left, value, right):
//
//        }
//    }
//
//    func findDistance(root: BST, node1: Int, node2: Int) {
//        var d1 = -1
//        var d2 = -1
//        var dist = 0
//
//        let lowestCommonAncestor = findDistanceUtil(node1, node2, 1)
//    }
//}
//
//func bstDistance(num:Int, values:[Int], node1:Int, node2:Int)->Int
//{
//    // num = num elements in list
//    // values = representing list of integers
//    // node1 = first node
//    // node2 = second node
//    // return distance between node1 and node2, else return -1 if either are not present
//    var bst: BST<Int> = .empty
//    for value in values {
//        bst.insert(newValue: value)
//    }
//    bst.traverseInOrder { print($0)}
//
//    return 0
//}
//bstDistance(num: 6, values: [5,6,3,1,2,4], node1: 2, node2: 4)
