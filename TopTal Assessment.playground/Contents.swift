import UIKit

public func solution(_ s: inout String) -> Int {
    let numLetters = s.count
    let numA = determineACount(s: s)
    
    if splitInThree(numA: numA) == false {
        return 0
    }
    
    
    
    
    return numA
}



func splitInThree(numA: Int) -> Bool {
    return numA % 3 == 0
}

func determineACount(s: String) -> Int {
    var aCount = 0
    for char in s {
        print("found character \(char)")
        if char == "a" {
            aCount+=1
        }
    }
    return aCount
}

var str = "ababaaba"
print(solution(&str))






extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}

func start(on str: String) {
    print(countCharacters2(on: str))
    parse(characters: <#T##[Character]#>, count: <#T##[Int]#>)
}

func countCharacters(on str: String) -> [Character: Int]{
    var countHolder: [Character: Int] = [:]
    var prevChar: Character = str[0]
    countHolder[prevChar] = 0
    for char in str {
        print(char)
        if prevChar == char {
            countHolder[char]! += 1
        } else {
            print("new char")
            prevChar = char
            countHolder[char] = 1
        }
    }
    return countHolder
}

func countCharacters2(on str: String) -> ([Character], [Int]){
    var charHolder: [Character] = []
    var countHolder: [Int] = []
    var countIndex: Int = 0
    var prevChar: Character = str[0]
    charHolder.append(prevChar)
    countHolder.append(0)
    
    for char in str {
        print(char)
        if prevChar == char {
            countHolder[countIndex] += 1
        } else {
            print("new char")
            prevChar = char
            countIndex += 1
            charHolder.append(char)
            countHolder.append(1)
        }
    }
    return (charHolder, countHolder)
}

func parse(characters: [Character], count: [Int]) -> String {
    var basicString = ""
    // should be equal to count array num of elements
    for i in 0..<characters.count {
        if count[i] == 1 {
            print(characters[i])
            basicString += "\(characters[i])"
        } else {
            basicString += "\(count[i])\(characters[i])"
        }
    }
    return basicString
}


start(on: "DAAAVVEEEEAAA")
