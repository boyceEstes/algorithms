import UIKit

func solveMeFirst(a: Int, b: Int) -> Int {
    return a + b
}


let zeroRatio = 0.666000
print(String(format: "%.6f", zeroRatio), terminator: "")
print("*")


var arr = [5, 3, 2, 1, 4, 5]
let max = arr.max()
print(arr.reduce(0) {result, current in
    if max == current{
        return result + 1
    } else {
        return result
    }
})


