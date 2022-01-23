import UIKit

var str = "Hello, playground"

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var queryMatches: [String: Int] = [:]
    var matchNum: [Int] = []
    
    for query in queries {
        queryMatches[query] = 0
    }
    
    for str in strings {
        if queryMatches[str] != nil {
            queryMatches[str]! += 1
        } else {
            print("query matches")
        }
    }
    
    for query in queries {
        matchNum.append(queryMatches[query]!)
    }
    
    return matchNum
}

let testStrings = ["aba", "baba", "aba", "xzxb"]
let testQueries = ["aba", "xzxb", "ab"]

print(matchingStrings(strings: testStrings, queries: testQueries))
