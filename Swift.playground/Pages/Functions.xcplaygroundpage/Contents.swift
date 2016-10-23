//: [Previous](@previous)

import UIKit

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3])
"min is \(bounds.min) and max is \(bounds.max)"

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}
greet(person: "Bill", from: "Cupertino")

func someFunction(_ firstParamName: Int, secondParamName: Int = 12) {
    
}
someFunction(1, secondParamName: 2)

func arithmenticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmenticMean(1, 2, 3, 4, 5)
arithmenticMean(3, 8.25, 18.75)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
"SomeInt is now \(someInt), and anotherInt is now \(anotherInt)"

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
"Result: \(mathFunction(2, 3))"

mathFunction = multiplyTwoInts
"Result: \(mathFunction(2, 3))"

//: [Next](@next)
