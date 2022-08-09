import Foundation

// Protocols and classes

protocol MyProtocolOne {
    func printOne()
}
protocol MyProtocolTwo {
    func printTwo()
}
protocol MyProtocolSix {
    func printSix()
}

class MyClassOne: MyProtocolOne {
    func printOne() {
        print("One")
    }
}
class MyClassTwo: MyProtocolTwo {
    func printTwo() {
        print("Two")
    }
}
class MyClassSix: MyProtocolSix {
    func printSix() {
        print("Six")
    }
}

// Error

enum MyError: Error {
    case instanceAlreadyRegistered
}

// Main class

class MyClass {
    private var instances = [AnyObject]()

    func register<T>(_ instance: T) throws where T: AnyObject {
        if let _: T = resolve() {
            throw MyError.instanceAlreadyRegistered
        }
        instances.append(instance)
    }

    func resolve<T>() -> T? {
        instances.first { $0 is T } as? T
    }
}

// Testing

let one = MyClassOne()
let two = MyClassTwo()
let six = MyClassSix()

let myClass = MyClass()

do {
    try myClass.register(one)
    try myClass.register(two)
//    try myClass.register(six)
//    try myClass.register(one) // this line will throw an exception
} catch {
    print(error)
}

if let resolveOne: MyProtocolOne = myClass.resolve() {
    resolveOne.printOne()
} else {
    print("One wasn't registered")
}

if let resolveSix: MyProtocolSix  = myClass.resolve() {
    resolveSix.printSix()
} else {
    print("Six wasn't registered")
}
