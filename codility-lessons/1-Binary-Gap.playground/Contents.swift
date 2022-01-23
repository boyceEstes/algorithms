import UIKit

var str = "Hello, playground"


func solution(_ N: Int) -> Int {
    
    var gapSearch = false
    var zeros = 1
    var maxZeros = 0
    
    let binaryN = String(N, radix: 2)
    for i in binaryN {
        
        if !gapSearch {
            // we are looking for a 0
            if i == "0" {
                gapSearch = true
            }
        } else {
            // we have a zero and are looking for a 1
            if i == "1" {
                gapSearch = false
                maxZeros = max(zeros, maxZeros)
                zeros = 1
            } else if i == "0" {
                zeros += 1
            }
        }
        
//        print("i: \(i)")
    }
//    print(binaryN)
    return maxZeros
}

print(solution(1041))
