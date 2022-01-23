import UIKit

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    return Int((Double(Y - X) / Double(D)).rounded(.up))
}

print(solution(5, 105, 3))
