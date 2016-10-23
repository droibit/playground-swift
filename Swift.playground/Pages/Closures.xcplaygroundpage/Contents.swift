//: [Previous](@previous)

import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: {s1, s2 in
    return s1 > s2})

reversedNames = names.sorted(by: {s1, s2 in
    s1 > s2})

reversedNames = names.sorted(by: { $0 > $1 })

reversedNames = names.sorted(by: >)
reversedNames = names.sorted(by: <)

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zeo", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
strings

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(comp: @escaping () -> Void) {
    completionHandlers.append(comp)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

let someClass = SomeClass()
someClass.doSomething()
someClass.x

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let customerProvider = { customersInLine.remove(at: 0) }

func serve(customer customerProvider: @autoclosure () -> String) {
    "Now serving \(customerProvider())!"
}
serve(customer: customersInLine.remove(at: 0))



//: [Next](@next)
