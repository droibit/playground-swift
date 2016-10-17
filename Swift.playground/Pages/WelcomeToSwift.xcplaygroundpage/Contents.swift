//: Playground - noun: a place where people can play

import UIKit

let vegetable = "red pepper"
switch vegetable {
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup.")
}

for i in 0..<3 {
    print("0..<\(i)")
}

for i in 0...3 {
    print("0...\(i)")
}

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet("John", on: "Wednesday")

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 594, 12)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

let increment = makeIncrementer()
increment(7)
increment(8)

let numbers = [20, 19, 7, 12]
let mapppedNumbers = numbers.map { $0 * $0 }
print(mapppedNumbers)


class Shape {
    
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

let shape = Shape()
shape.numberOfSides = 7
print(shape.simpleDescription())

class NamedShape {
    
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let square = Square(sideLength: 5.2, name: "my test square")
square.area()
square.simpleDescription()

class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triange with sides of length \(sideLength)"
    }
}

let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
optionalSquare?.sideLength

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return "\(self.rawValue)"
        }
    }
}
let ace = Rank.ace
let aceRawValue = Rank.ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    convertedRank.simpleDescription()
}

enum Suit {
    
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}

struct Card {
    
    var rank: Rank
    
    var suite: Suit
    
    func simpleDescription() -> String {
        return "The \(rank) of \(suite)."
    }
}
Card(rank: .three, suite: .spades).simpleDescription()

enum SeverResponse {
    case result(String, String)
    case failure(String)
}

switch SeverResponse.result("6:00", "8:09 pm") {
case let .result(sunrise, sunset):
    "Sunrise is at \(sunrise), sunset is as \(sunset)."
case let .failure(message):
    "Failure... \(message)"
}

protocol ExampleProtocol {
    var simpleDescription: String { get }
    
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple calss."
    
    var anotherProperty: Int = 69105
 
    func adjust() {
        simpleDescription += " now 100% adjusted."
    }
}
var simpleClass = SimpleClass()
simpleClass.adjust()
simpleClass.simpleDescription

extension Int: ExampleProtocol {
    
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

let exampleProtocol: ExampleProtocol = simpleClass
exampleProtocol.simpleDescription

enum PrinterError: Error {
    case outOfPager
    case noToner
    case onFire
}

func sendPrinter(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let pinterResponse = try sendPrinter(job: 1040, toPrinter: "Never has Toner")
} catch PrinterError.onFire {
    "I'll just put this over here, with the rest of the fire."
} catch let printerError as PrinterError {
    "Printer error: \(printerError)"
} catch {
    error
}

let printerSuccess = try? sendPrinter(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? sendPrinter(job: 1885, toPrinter: "Never has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
fridgeIsOpen

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])

