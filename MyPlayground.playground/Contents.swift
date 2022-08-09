import Foundation

enum MyError: Error {
    case instanceAlreadyRegistered
}

class MyClass {
    private var instances = [Any]()

    func register<T>(_ instance: T) throws where T: Any {
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

let one: MyProtocolOne = MyClassOne()
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
