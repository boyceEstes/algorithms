import UIKit

/*
 Misunderstood the problem at first. Thought it required the max radius that encompassed all points without duplicates
 Instead it just wants the number of points within the radius so there might be alittle bit of commented code. Mostly
 the same process, though
 */

// Test cases:
//0
//let testStr = "AAA"
//let testX = [1, 1, 1]
//let testY = [-2, 2, 1]
//1
//let testStr = "ABDCA"
//let testX = [2, -1, -4, -3, 3]
//let testY = [2, -2, 4, 1, -3]
// expected output: 3
//// 2
//let testStr = "ABB"
//let testX = [1, -2, -2]
//let testY = [1, -2, 2]
//// expected output: 1
////3
let testStr = "CCD"
let testX = [1, -1, 2]
let testY = [1, -1, -2]
//// expected output: 0

// Passes All tests!

typealias Point = (Int, Int)

func solution(_ S: String, _ X: [Int], _ Y: [Int]) -> Int {
   
    var count = 0
    var radiusLimit = -1 // not set
    var charactersRadius: [Character: Int] = [:]
    
    for i in 0..<testX.count {
        let currentChar = S[S.index(S.startIndex, offsetBy: i)]
        if let characterRadius = charactersRadius[currentChar] {
            print("character is stored")
            let point = (X[i], Y[i])
            let newCharacterRadius = calcRadius(for: point)
            if characterRadius > newCharacterRadius {
                print("triggereed 1")
                charactersRadius[currentChar] = newCharacterRadius
                // decrease the radius limit to not include new point, unless radius limit is already smaller
                if radiusLimit > newCharacterRadius || radiusLimit == -1 {
                    radiusLimit = newCharacterRadius
                }
            } else {
                print("triggered 2")
                if radiusLimit > newCharacterRadius || radiusLimit == -1{
                    radiusLimit = newCharacterRadius
                }
            }
        } else {
            // not recorded yet
            print("new character")
            let point = (X[i], Y[i])
            charactersRadius[currentChar] = calcRadius(for: point)
        }
    }
    
    for (_, radius) in charactersRadius {
        print("radius limit: \(radiusLimit)")
        if radiusLimit == -1 {
            // assume that there will always be a duplicate character somewhere
            // return the most possible
//            maxRadius = max(radius, maxRadius)
        } else {
            // return the most that is less than the radius limit
            if radius < radiusLimit {
//                maxRadius = max(maxRadius, radius)
                count += 1
            }
        }
        
    }
    
    return count
}

func calcRadius(for point: Point) -> Int {
    let x = Double(point.0)
    let y = Double(point.1)
    let distance: Double = sqrt((x * x) + (y * y))
    let radius: Int = Int(distance.rounded(.up))
    return radius
}

print(solution(testStr, testX, testY))
