import UIKit

func timeConversion(s: String) -> String {
    let nonConvertedHour = s.prefix(2)
    guard var convertedHour = Int(nonConvertedHour) else { return s }
    let timeOfDay = s.suffix(2)
    if  timeOfDay == "PM" {
        if convertedHour != 12 {
            convertedHour += 12
        }
    } else if timeOfDay == "AM" {
        if convertedHour == 12 {
            convertedHour -= 12
        }
    }
    
    let range = s[s.index(s.startIndex, offsetBy: 2)..<s.index(s.startIndex,offsetBy: 8)]
    let strForRange = String(range)
    let newTime: String = String(format: "%02d%@", convertedHour, strForRange)
    
    return newTime
}

let testStr = "12:45:54PM"
print(timeConversion(s: testStr))

