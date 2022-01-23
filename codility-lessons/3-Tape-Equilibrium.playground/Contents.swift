import UIKit

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    var minValue = 2000
    let arraySum = A.reduce(0) { $0 + $1 }
    var leftSum = 0
    var rightSum = 0
    
    for i in 1..<A.count {
        
        leftSum = leftSum + A[i-1]
        rightSum = arraySum - leftSum
        
        minValue = min(minValue, abs(leftSum - rightSum))
//        print(minValue)
    }
    
    return minValue
}

var arr = Array(repeating: 1, count: 100_000)
print(solution(&arr))
