import UIKit

// test 1
//let testStr = "ABBBCCDDCCC"
//let testK = 3
// A3B2C2D3C = 9 (compressed length)
// output : 5

// test 2
let testStr = "AAAAAAAAAAABXXAAAAAAAA"
let testK = 3
// output : 3 - because after BXX is removed, A compresses to some 2 digit number

func solution(S: String, K: Int) -> Int {
    
    var compressedLength: Int = -1
    var compressedLengthsForIndexOfRemoval: [Int: Int] = [:]
    
    for i in 0...S.count-K{
        // get starting index for this character
        let startIndexForI = S.index(S.startIndex, offsetBy: i)
        var tempStr = S
        for _ in 0..<K {
            tempStr.remove(at: startIndexForI)
        }
        
        let storeLength = calculateCompressedStringLength(for: tempStr)
        print("tempStr for index \(i) is \(tempStr) = \(storeLength)")
        compressedLengthsForIndexOfRemoval[i] = storeLength
    }
    
    for (index, potentialCompressedLength) in compressedLengthsForIndexOfRemoval {
        print("compressed length at index \(index) = \(potentialCompressedLength)")
        if compressedLength == -1 {
            compressedLength = potentialCompressedLength
        } else {
            compressedLength = min(compressedLength, potentialCompressedLength)
        }
    }
    
    return compressedLength
}

func calculateCompressedStringLength(for str: String) -> Int {
    var total = 0
    var consecutiveCharacters = 0
    var lastChar: Character? = nil
    
    for curChar in str {
        if lastChar == nil || lastChar != curChar {
            total += 1
            consecutiveCharacters = 1
            lastChar = curChar
            print("New character: \(curChar). total = \(total). consecutive characters: \(consecutiveCharacters)")
        } else if lastChar == curChar {
            consecutiveCharacters += 1
            
            if consecutiveCharacters == 2 ||
                consecutiveCharacters == 10 ||
                consecutiveCharacters == 100 ||
                consecutiveCharacters == 1000 ||
                consecutiveCharacters == 10000 ||
                consecutiveCharacters == 100000 {
                total+=1
            }
            print("Same character as previous: \(curChar). total \(total). consecutive cahracters: \(consecutiveCharacters)")
        }
    }
    
    return total
}


print(solution(S: testStr, K: testK))
//print(calculateCompressedStringLength(for: testStr))
