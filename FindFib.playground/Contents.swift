import UIKit

func findFib(n: Int) -> Int{
    if n == 0 {
        return 0
    }
    
    if n == 1 {
        return 1
    }
    
    return findFib(n: n-1) + findFib(n: n-2)
}

print(findFib(n: 5))
