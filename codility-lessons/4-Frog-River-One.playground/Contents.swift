import UIKit
// O(N * X)
public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    // simple solution: create a bucket for each value, mark as you go down the list and return
    // the time when the last one is marked
    var bucket = Array.init(repeating: false, count: X+1)
    var steps = X
    for i in 0..<A.count {
        if !bucket[A[i]] {
            bucket[A[i]] = true
            steps -= 1
            
            if steps == 0 {
                return i
            }
        }
    }
    return -1
    
    
    /*
     My solution: 1 off for some reason that I could never figure out
     ex: got 84 expected 83
         got 154 expected 153
     */
    
//    var positionNeeded = 1
//    var availablePositions = Set<Int>()
//    var totalTime = 0
//
//    for i in 0..<A.count {
//        // check available positions before looking at current second
//        while(availablePositions.contains(positionNeeded)) {
//            availablePositions.remove(A[i])
//            positionNeeded += 1
//
//            if positionNeeded == X+1 {
//                break
//            }
//        }
//
//        if A[i] == positionNeeded {
//            positionNeeded += 1
//            totalTime = i
//            if positionNeeded == X+1 {
//                break
//            }
//        } else if A[i] > positionNeeded {
//            availablePositions.insert(A[i])
//        }
//    }
//
//    if positionNeeded != X+1 {
//        return -1
//    }
//
//    return totalTime
}

var arr = [1,3,1,4,2,3,5,4]
print(solution(5, &arr))
