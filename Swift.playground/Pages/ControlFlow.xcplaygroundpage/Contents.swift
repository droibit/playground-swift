//: [Previous](@previous)

import UIKit

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    "\(x), \(y) is on the line x == y"
case let (x, y) where x == -y:
    "\(x), \(y) is on the line x == -y"
case let (x, y):
    "\(x), \(y) is just some arbitrary point"
}

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also"
    fallthrough
default:
    description += "an integer."
}

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    "Hello \(name)"
    
    guard let location = person["location"] else {
        "I hope the weather is nice near you."
        return
    }
    "I hope the weather is nice in \(location)"
}
greet(person: ["name": "John"])

if #available(iOS 10, *) {
    "Use iOS 10 Apis on iOS"
}

//: [Next](@next)
