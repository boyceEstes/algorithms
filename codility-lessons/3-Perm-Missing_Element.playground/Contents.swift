import UIKit

var str = "Hello, playground"

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    var bucketDict = [Int: Int]() // N+1 keys, with a value of 1 to begin
    // initialize bucket
    let aLength = A.count + 1
    for i in 1...aLength {
        bucketDict[i] = 1
    }
    
    for element in A {
        if bucketDict[element] != nil {
            bucketDict[element]! -= 1
        }
    }
    print(bucketDict)
    
    return bucketDict.filter { $0.value == 1 }.first!.key
}

var arr = [2,3,1,5]
print(solution(&arr))
