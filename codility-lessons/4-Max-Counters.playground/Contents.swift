import UIKit

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    var counters = Array(repeating: (0,0), count: N)
    counters[0] = (1,2)
    let newCounters = counters.map { $0.0 }
//    var addValuesToAll: [Int] = []
//    var maxCounterValue = 0
//
//    for i in 0..<A.count {
//        if A[i] <= N {
//            counters[A[i]-1] += 1
//            maxCounterValue = max(maxCounterValue, counters[A[i]-1])
//        } else if A[i] == N+1 {
//            addValuesToAll.append(maxCounterValue)
//        }
//    }
//
//    counters = counters.map {
//        var newValue = $0
//        for i in 0..<addValuesToAll.count {
//            newValue += addValuesToAll[i]
//        }
//        return newValue
//    }
//    return counters
    return newCounters
}

var arr = [3, 4, 4, 6, 1, 4, 4]
var arr2 = [1]
print(solution(5, &arr))
