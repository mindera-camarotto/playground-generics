import Foundation

public protocol MyProtocolOne {
    func printOne()
}
public protocol MyProtocolTwo {
    func printTwo()
}
public protocol MyProtocolSix {
    func printSix()
}

public class MyClassOne: MyProtocolOne {
    public init() { }
    public func printOne() {
        print("One")
    }
}
public class MyClassTwo: MyProtocolTwo {
    public init() { }
    public func printTwo() {
        print("Two")
    }
}
public class MyClassSix: MyProtocolSix {
    public init() { }
    public func printSix() {
        print("Six")
    }
}
