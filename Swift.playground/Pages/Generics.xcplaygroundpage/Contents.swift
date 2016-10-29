//: [Previous](@previous)

import UIKit

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "worold"
swapTwoValues(&someString, &anotherString)

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack<String>()
stackOfString.push("uno")
stackOfString.push("dos")
stackOfString.pop()

extension Stack {
    
    var topItem: Element? {
        return items.last
    }
}

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
let doubleIndex = findIndex(of: 9.3, in: [3.14, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcom", "Andrea"])

protocol Container {
    
    associatedtype ItemType
    
    mutating func append(_ item: ItemType)
    
    var count: Int { get }
    
    subscript(i: Int) -> ItemType { get }
}

struct Stack2<Element>: Container {
    
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

func allItemsMatch<C1: Container, C2: Container>(_ lhs: C1, _ rhs: C2) -> Bool
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        if lhs.count != rhs.count {
            return false
        }
        
        for i in 0..<lhs.count {
            if lhs[i] != rhs[i] {
                return false
            }
        }
        return true
}



//: [Next](@next)
