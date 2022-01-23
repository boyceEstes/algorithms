import UIKit


public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    var pairDict: [Int: Int] = [:]
    
    for i in arr {
        if pairDict[i] != nil {
            pairDict[i]! += 1
        } else {
            pairDict[i] = 1
        }
    }
    
    print(pairDict)
    let unpaired = pairDict.filter { (x, y) in
       y % 2 != 0
    }
    
    // should be only 1 result
    return unpaired.first!.key
}

var arr = [2,3,2,8,9,9,8]
print(solution(&arr))
