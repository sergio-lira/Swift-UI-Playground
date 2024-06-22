import UIKit




// MARK: - Generics #generics
// URL: https://youtu.be/a3AH0ItFTKU?si=_jrP_oMDIfr7eU8W by Saen Allen
determineHigherValue(valueOne: 3, valueTwo: 8)
determineHigherValue(valueOne: "Sergio", valueTwo: "Swift")
determineHigherValue(valueOne: Date.now, valueTwo: Date.distantPast)

var numbersArray = Array(repeating: 3, count: 10)
var stringArray = Array(repeating: "Sean", count: 5)
numbersArray.append(4)
stringArray.append("Swift")

// MARK: - Where #where #controlFlow
// URL: https://youtu.be/gZa_wZ1GJ8I?si=zAquXvBIpw0xiMX7 by Sean Allen
import Foundation
let values = [458, 1239, 10334, 1938, 123, 54359, 2834091]

// 1. Simplify for loops
for value in values {
    if value > 5000 {
        print(value)
    }
}
for value in values where value > 5000 {
    print(value)
}

// 2. Array Elements
let firstEven = values.first(where: { $0 % 2 == 0 })
print(firstEven!)
let hasProfit = values.contains(where: { $0 > 60000 })
print(hasProfit)

// 3. Constrains on Protocol Extension
extension Array where Element == Int {
    func sum() -> Int {
        reduce(0, +)
    }
}
let sum = values.sum()
let names = ["Sergio", "Asela"]
// let sumOfNames = names.sum() // wont work
