//: [Previous](@previous)

import UIKit

var someInts = [Int]()
"SomeInts is of type [Int] with \(someInts.count) items."
someInts.append(3)

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherTreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherTreeDoubles

var shoppingList = ["Eggs", "Milk"]
if shoppingList.isEmpty {
    "The shopping list is empty."
} else {
    "The shopping list is not empty."
}
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

let firstItem = shoppingList[0]
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
let apple = shoppingList.removeLast()

for item in shoppingList {
    item
}

for (index, value) in shoppingList.enumerated() {
    "Item \(index + 1): \(value)"
}

var letters = Set<Character>()
"letters is of type Set<Character> with \(letters.count) items."
letters.insert("a")

var favoriteGenres: Set = ["Rock", "Classical", "Hip Hop"]
"I have \(favoriteGenres.count) favorite music genres."
favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    "\(removedGenre)? I'm over it."
}

if !favoriteGenres.contains("Funk") {
    "It's too funky in here."
}

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
"The airports dictionary contains \(airports.count) items."
airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    "The old value for DUB was \(oldValue)"
}

if let airportName = airports["DUB"] {
    "The name of airport is \(airportName)"
}

if let removedValue = airports.removeValue(forKey: "DUB") {
    "The removed airport's name is \(removedValue)."
}

for (airportCode, airportName) in airports {
    "\(airportCode): \(airportName)"
}


//: [Next](@next)
