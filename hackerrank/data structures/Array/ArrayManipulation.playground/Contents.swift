import Foundation

func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    var newArray = Array(repeating: 0, count: n)
    var maxValue = 0
    for row in queries {
        let a = row[0]
        let b = row[1]
        let k = row[2]
//        print("a: \(a), b: \(b), k: \(k)")
        
        for i in a...b {
            let index = i-1
//            print("index: \(index)")
            newArray[index] += k
            maxValue = max(maxValue, newArray[i-1])
        }
    }
    return maxValue
}


func arrayManipulationSmart(n: Int, queries: [[Int]]) -> Int {
    // array is one more than n
    var newArray = Array(repeating: 0, count: n+1)
    var maxValue = 0
    
    for i in 0..<n {
        let a = queries[i][0]
        let b1 = queries[i][1] + 1
        let k = queries[i][2]
        // increase the beginning index by k
        newArray[a] += k
        
        // we don't care if the streak ends after the array is over. we only put in this
        // next part so that we can know when to not include a streak amount
        if b1 <= n {
            newArray[b1] -= k
        }
    }
    
    // go through 1 to n inclusive - 0 can never be reached since the queries do not include 0 in their ranges
    for i in 1...n {
        // array at i would be the incremented value of any k that used this number as the start of their range
        // if we add the previous array then we should account for all ranges since the range amount is subtracted after we get past it.
        // we can use this method to find the
        newArray[i] += newArray[i-1]
        maxValue = max(maxValue, newArray[i])
    }
    
    return maxValue
    
}


let testArray = [
    [1, 2, 100],
    [2, 5, 100],
    [3, 4, 100]
]

print(arrayManipulation(n: 5, queries: testArray))
