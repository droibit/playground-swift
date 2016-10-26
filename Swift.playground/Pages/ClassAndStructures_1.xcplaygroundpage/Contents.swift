//: [Previous](@previous)

import UIKit


struct Resolution {
    
    var width = 0
    var height = 0
}

class VideoMode {
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

"The width of someResolution is \(someResolution.width)"

someVideoMode.resolution.width = 1280
"The width of someResolution is \(someVideoMode.resolution.width)"

let vga = Resolution(width: 640, height: 480)
let hd = Resolution(width: 1920, height: 1080)

var cinema = hd
cinema.width = 2048

"cinema is now \(cinema.width) pixels wide"
"hd is still \(hd.width) pixels wide"

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

"The frameRate property of tenEighty is now \(tenEighty.frameRate)"

if tenEighty === alsoTenEighty {
    "tenEighty and alsoTenEighty refer to the same VideMode instance."
}

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

class DateImporter {
    
    var fileName = "data.txt"
}

class DataManager {
    
    lazy var importer = DateImporter()
    
    var data = [String]()
}
let dataManager = DataManager()
dataManager.data.append("Some data")
dataManager.data.append("Some more data")
dataManager.importer.fileName

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    mutating func moveBy2(x deltaX: Double, y deltaY: Double) {
        self = Point(x: x + deltaX, y: y + deltaY)
    }
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
"Square.origin is now at \(square.origin.x), \(square.origin.y)"

struct Cuboid {
    
    var width = 0.0, height = 0.0, depth = 0.0
    
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
"the volue of fourByFiveByTwo is \(fourByFiveByTwo.volume)"

class StepCounter {

    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            "About to set totalSteps to \(newTotalSteps)"
        }
        didSet {
            if totalSteps > oldValue {
                "Added \(totalSteps - oldValue) steps"
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200

struct SomeStructure {
    
    static var storedTypeProperty = "Some value"
    
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumration {
    static var storedTypeProperty = "Some value"
    
    static var computedTypeProperty: Int {
        return 1
    }
}

class SomeClass {
    
    class func someTypeMethod() {
        "test"
    }
}

class Counter {
    var count = 0
    
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.increment(by: 5)
counter.count
counter.reset()
counter.count

var somePoint = Point(x: 3.0, y: 3.0)
somePoint.moveBy(x: 2.0, y: 3.0)

var fixedPoint = Point(x: 5.0, y: 5.0)
fixedPoint.moveBy2(x: 2.0, y: 3.0)

SomeClass.someTypeMethod()

struct LevelTracker {
    
    static var highestUnlockedLevel = 1
    
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    init(name: String) {
        playerName = name
    }
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
"highest unlocked level is now \(LevelTracker.highestUnlockedLevel)"

struct TimesTable {
    let multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
"six times three is \(threeTimesTable[6])"

struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0.0, count: rows * columns)
        
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows &&
            column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

class Vehicle {
    
    var currentSpeed = 0.0
    
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
    }
}

let someVehicle = Vehicle()
someVehicle.description

class Bicycle : Vehicle {
    
    var hasBasket = false
}
var bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
"Bicycle: \(bicycle.description)"

class Train: Vehicle {
    
    override func makeNoise() {
        "Choo Choo"
    }
}
let train = Train()
train.makeNoise()

class Car: Vehicle {
    
    var gear = 1
    
    override var description: String {
        return super.description + "in gear \(gear)"
    }
    
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
"Car: \(car.description)"

struct Fahrenheit {
    
    var temperature = 32.0
}
var f = Fahrenheit()
"The default temperature is \(f.temperature) Fahrenheit"

struct Celsius {
    
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
"boilingPointOfWater.temperatureInCelsius is \(boilingPointOfWater.temperatureInCelsius)"

let freezingPointOfWater = Celsius(fromFahrenheit: 212.0)
"freezingPointOfWater is \(freezingPointOfWater.temperatureInCelsius)"

let bodyTemprature = Celsius(37.0)
"bodyTemprature is \(bodyTemprature.temperatureInCelsius)"

struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

class SurveyQuestion {
    var text: String?
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        text
    }
}

class Food {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")

class RecipeIngredient: Food {
    
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    
    var purchased = false
    
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✓" : "×"
        return output
    }
}

struct Animal {
    
    let species: String
    
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "")
"someCreature is \(someCreature)"

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
let fahrenheitUnit = TemperatureUnit(symbol: "F")

//: [Next](@next)
