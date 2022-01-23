import UIKit

// return the number of ways that we could split a string comprised of a & b into 3 separate segments that have an equal number of a's.

public func solution(_ S: String) -> Int {
    var possibleSegmentsWithEqualAs = 0
    
    var rightPartition = 1
    var leftPartition = S.count - 1
    
    while rightPartition < S.count-1 {
        while leftPartition > rightPartition {
            let firstPartition = S.prefix(rightPartition)
            
            let rightPartitionIndex = S.index(S.startIndex, offsetBy: rightPartition)
            let leftPartitionIndex = S.index(S.startIndex, offsetBy: leftPartition)
            let midPartition = S[rightPartitionIndex..<leftPartitionIndex]
            
            let lastPartition = S[leftPartitionIndex...]
            
            let firstPartitionACount = firstPartition.reduce(0) { if $1 == "a" { return $0 + 1 } else { return $0 }}
            let midPartitionACount = midPartition.reduce(0) { if $1 == "a" { return $0 + 1 } else { return $0 }}
            let lastPartitionACount = lastPartition.reduce(0) { if $1 == "a" { return $0 + 1 } else { return $0 }}
            
            if firstPartitionACount == midPartitionACount && firstPartitionACount == lastPartitionACount {
                possibleSegmentsWithEqualAs += 1
            }
            
            leftPartition -= 1
        }
        rightPartition += 1
        leftPartition = S.count - 1
    }
    
    return possibleSegmentsWithEqualAs
}

//let testStr = "ababa"
//let testStr = "babaa"
//let testStr = "bbbbb"
let testStr = "aba"
print(solution(testStr))
