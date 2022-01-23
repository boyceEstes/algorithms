import UIKit

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    var shiftedArray: [Int] = A
    
    for _ in 0..<K {
        shiftedArray = shiftArray(input: shiftedArray)
    }
    
    A = shiftedArray
//    print(shiftedArray)
    return shiftedArray
}

public func shiftArray(input: [Int]) -> [Int] {
    var shiftArray = input
    
    let lastElement = shiftArray[shiftArray.count - 1]
    for i in (1..<shiftArray.count).reversed() {
//        print("\(i) = \(i): \(shiftArray[i])")
        shiftArray[i] = shiftArray[i-1]
    }
    shiftArray[0] = lastElement
    
    return shiftArray
}

var arr = [3,8,9,7,6]
print(arr)
solution(&arr, 3)

