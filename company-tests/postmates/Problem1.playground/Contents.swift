import UIKit

//func binaryPatternMatching(pattern: String, s: String) -> Int {
//    var count = 0
//    for i in 0..<s.count - pattern.count+1 {
//        var invalid: Bool = false
//
//        let startRange = s.index(s.startIndex, offsetBy: i)
//        let endRange = s.index(s.startIndex, offsetBy: i + pattern.count)
//        let subString = String(s[startRange..<endRange])
//
////        print("substring count: \(subString.count), should be equal to \(pattern.count)")
//        for j in 0..<subString.count {
//            if  subString[s.index(s.startIndex, offsetBy: j)] == "a" ||
//                subString[s.index(s.startIndex, offsetBy: j)] == "e" ||
//                subString[s.index(s.startIndex, offsetBy: j)] == "i" ||
//                subString[s.index(s.startIndex, offsetBy: j)] == "o" ||
//                subString[s.index(s.startIndex, offsetBy: j)] == "u" ||
//                subString[s.index(s.startIndex, offsetBy: j)] == "y" {
//
//                if pattern[pattern.index(pattern.startIndex, offsetBy: j)] != "0" {
//                    invalid = true
//                    break
//                }
//
//            } else {
////                print("consonant")
//                if pattern[pattern.index(pattern.startIndex, offsetBy: j)] != "1" {
//                    invalid = true
//                    break
//                }
//            }
//        }
//
//        if !invalid {
//            count += 1
//        }
//    }
//    return count
//}
//
//let testStr = "aaaaaaaaaa"
//let testPattern = "00"
//print(binaryPatternMatching(pattern: testPattern, s: testStr))
//



//func checkBlanagrams(word1: String, word2: String) -> Bool {
//    var anniegramAreYouOkay: [Character: Int] = [:]
//    for character in word1 {
//        if anniegramAreYouOkay[character] != nil {
//            anniegramAreYouOkay[character]! += 1
//        } else {
//            anniegramAreYouOkay[character] = 1
//        }
//    }
//    print(anniegramAreYouOkay)
//
//    for character in word2 {
//        if anniegramAreYouOkay[character] != nil {
//            anniegramAreYouOkay[character]! -= 1
//        } else {
//            anniegramAreYouOkay[character] = -1
//        }
//    }
//
//    print(anniegramAreYouOkay)
//
//    let filteredZeroes = anniegramAreYouOkay.filter { $0.value != 0}
//    print(filteredZeroes)
//
//    if filteredZeroes.count == 0 {
//        print("is anagram")
//        return false
//    }
//
//    let filteredNegatives = anniegramAreYouOkay.filter { $0.value < 0 }
//    print(filteredNegatives)
//
//    if filteredNegatives.count > 1 {
//        print("more than one character is missing")
//        return false
//    }
//
//    let filteredPositives = anniegramAreYouOkay.filter { $0.value > 0 }
//    print(filteredPositives)
//
//    if filteredPositives.count > 1 {
//        print("Too many characters where added")
//        return false
//    }
//
//    return true
//}
//
//
//
////let testStr = "tangram"
////let testStr2 = "anagram"
////let testStr = "silent"
////let testStr2 = "listen"
//let testStr = "tangram"
//let testStr2 = "pangram"
//print(checkBlanagrams(word1: testStr, word2: testStr2))
//
//

func sudokuCheck(grid: [[Int]]) -> Bool {

    var gridChecker: [Int: Int] = [:]
    // check rows
    for i in 0..<9 {
        gridChecker = [:]
        for j in 0..<9 {
            if gridChecker[grid[i][j]] == nil {
                // insert the number, if it is not already there
                gridChecker[grid[i][j]] = 1
            } else {
                // if number is already there, something is wrong should not be duplicates
                print("row check: duplicate number in row \(i) at col \(j)")
                return false
            }
        }
    }

    // check Columns (grid.count/grid[i].count
    for i in 0..<9{
        gridChecker = [:]
        for j in 0..<9 {
            if gridChecker[grid[j][i]] == nil {
                // insert the number, if it is not already there
                gridChecker[grid[j][i]] = 1
            } else {
                // if number is already there, something is wrong should not be duplicates
                print("col check: duplicate number in row \(j) at col \(i)")
                return false
            }
        }
    }

    gridChecker = [:]
    // check grid
    for m in 0..<3 {
        for n in 0..<3 {
            gridChecker = [:]
            print("block: (\(m),\(n)):")
            for i in 0..<3 {
                for j in 0..<3 {
                    print(grid[(n*3)+i][(n*3)+j], terminator: " ")
                    if gridChecker[grid[j][i]] == nil {
                        gridChecker[grid[(n*3)+i][(n*3)+j]] = 1
                    } else {
                        print("grid check: duplicate number in block: (\(m),\(n)): row \(i) at col \(j)")
                        return false
                    }
                }
            }
            print()
        }
    }

//    for i in 0..<9 {
//        // Check digits in row #i:
////        let rowDigits = board[i].filter { $0 != "." }
//        if rowDigits.count != Set(rowDigits).count {
//            return false
//        }
//
//        // Check digits in column #i:
////        let colDigits = board.map { $0[i] }.filter { $0 != "." }
//        if colDigits.count != Set(colDigits).count {
//            return false
//        }
//
//        // Check digits in block #i:
//        let firstRow = 3 * (i / 3)
//        let firstCol = 3 * (i % 3)
//        let blockDigits = board[firstRow..<firstRow+3].flatMap { $0[firstCol..<firstCol+3]}
//            .filter { $0 != "." }
//        if blockDigits.count != Set(blockDigits).count {
//            return false
//        }
//    }

    return true
}

print(((300.0+257.0+260.0)/900.0))
