import UIKit




public func solution(_ S : inout String) -> String {
    // write your code in Swift 4.2.1 (Linux)
    var caps = false
    var newString = ""
    
    for element in S {
        switch element {
        case "C":
            caps.toggle()
        case "B":
            newString = newString != "" ? String(newString.dropLast()) : ""
        default:
            caps ? newString.append(String(element).uppercased()) : newString.append(element)
        }
    }
    
    return newString
}

var str = "CCC"
print("solution: '\(solution(&str))'")


