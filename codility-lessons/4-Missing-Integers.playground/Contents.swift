import UIKit

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var lowestNumber = 1
    var container = Set<Int>()
    for i in 0..<A.count {
        if A[i] == lowestNumber {
            lowestNumber += 1
        } else {
            if lowestNumber > 0 {
                container.insert(A[i])
            }
        }
    }
    
    while(container.contains(lowestNumber)) {
        lowestNumber += 1
    }
    
    return lowestNumber
}

var arr = [-1,-34]
var arr2 = [1,2,3,4]
var arr3 = [1,0,3]
var arr4 = [1,3,6,4,1,2]

print("solution1: \(solution(&arr)): \(solution(&arr) == 1)")
print("solution2: \(solution(&arr2)): \(solution(&arr2) == 5)")
print("solution3: \(solution(&arr3)): \(solution(&arr3) == 2)")
print("solution4: \(solution(&arr4)): \(solution(&arr4) == 5)")

