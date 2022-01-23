import UIKit



func hasPair(in numbers: Array<Int>, equalTo sum: Int) -> Bool {
    
    var set = Set<Int>()
    
    for i in 0..<numbers.count {
        let firstNumber = numbers[i]
        let searchFor = sum - firstNumber
        if set.contains(searchFor) {
            return true
        }
        set.insert(firstNumber)
    }
    
    return false
}


let testArr = [ 1, 2, 4, 4 ]
let targetValue = 7

print(hasPair(in: testArr, equalTo: targetValue))
