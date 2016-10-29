//: [Previous](@previous)

import UIKit

protocol FullyNamed {
    
    var fullName: String { get }
}

struct Person: FullyNamed {
    
    var fullName: String
}

let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
 
    var prefix: String?
    
    var name: String
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
"ncc1701.fullName is '\(ncc1701.fullName)'"

protocol RandomNumberGenerator {
    
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
"Here's random number: \(generator.random())"

protocol Togglable {
    
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    
    case off, on
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

class Dice {
    
    let slides: Int
    let generator: RandomNumberGenerator
    
    init(slides: Int, generator: RandomNumberGenerator) {
        self.slides = slides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(slides)) + 1
    }
}
var d6 = Dice(slides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

protocol DiceGame {
    
    var dice: Dice { get }
    
    func play()
}

protocol DiceGameDelegate {
    
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    
    let finalSquare = 25
    let dice = Dice(slides: 6, generator: LinearCongruentialGenerator())
    
    var square = 0
    var board: [Int]
    
    var delegate: DiceGameDelegate?
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;
    }
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        
        gameLoop: while square != finalSquare {
            
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and ladders")
        }
        print("The game is using \(game.dice.slides)-slide dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}
let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = tracker
game.play()

protocol TextRepresentable {
    
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    
    var textualDescription: String {
        return "A \(slides)-sided dice"
    }
}
let d12 = Dice(slides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

protocol Named {
    
    var name: String { get }
}

protocol Aged {
    
    var age: Int { get }
}

struct Person2: Named, Aged {
    
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
}
wishHappyBirthday(to: Person2(name: "Malcolm", age: 26))

@objc protocol CounterDataSource {
    
    @objc optional func increment(forCount count: Int) -> Int
    
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    
    var count = 0
    
    var dataSource: CounterDataSource?
    
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
           count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    
    let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

@objc class TowardsZeroSource: NSObject, CounterDataSource {
    
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = 4
counter.dataSource = TowardsZeroSource()

for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

//: [Next](@next)
