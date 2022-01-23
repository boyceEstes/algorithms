import UIKit

func reverseArray(a: [Int]) -> [Int] {
    var reversedArray: [Int] = []
    for element in a.reversed() {
        reversedArray.append(element)
    }
    return reversedArray
}


print(reverseArray(a: [1,2,3,4]))
