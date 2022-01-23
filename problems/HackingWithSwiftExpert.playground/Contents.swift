import UIKit

/* 4 */
// reference key paths in mapping
struct User {
    let name: String
}

let users = [User(name: "Jim"), User(name: "Diana"), User(name: "SeltzerRock")]
let names = users.map(\.name) // or map { $0.name }
print(names)

/* 5 */
// ~= and nested ternary operators
let i = 11
let j = 20
let name = 9...11 ~= i ? j % 2 == 1 ? "Larry" : "Laura" : "Libby"

/* 7 */
// declaring multiple variables at once in a tuple format
let (captain, engineer, doctor) = ("Mal", "mally", "maal")
print(engineer)

/* 11 */
// compact map - only the non nil values will be mapped
let names2: [String?] = ["barbara", nil, "david", nil, "Petey"]
let result = names2.compactMap { $0 }
print(result)

/* 12 */
// addingReportingOverflow
let resulty = UInt8.max.addingReportingOverflow(1)

let data: [Any?] = ["Bill", nil, 69, "Ted"]
for datum in data where datum is String? {
    print(datum)
}
for case let .some(datum) in data where datum is String {
    print(datum)
}


