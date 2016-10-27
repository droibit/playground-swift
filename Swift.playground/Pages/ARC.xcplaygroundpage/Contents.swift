//: [Previous](@previous)

import UIKit

class Apartment {
    
    let unit: String
    
    weak var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

class Person {
    
    let name: String
    
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "John Appleseed")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed2")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

print("----------")

class CreditCard {
    
    let number: UInt64
    
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

class Customer {
    
    let name: String
    
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var mike: Customer?
mike = Customer(name: "Mike")
mike?.creditCard = CreditCard(number: 1234_5678_9012_3456, customer: mike!)
mike = nil

class City {
    
    let name: String
    
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

class Country {
    
    let name: String
    
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}
var country = Country(name: "Canada", capitalName: "Ottawa")
"\(country.name)'s captinal citiy is \(country.capitalCity.name)"

class HTMLElement {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("HTMLElement:\(name) is being deinitialized")
    }
}
let heading = HTMLElement(name: "h1")
let defaultText = "Some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil



//: [Next](@next)
