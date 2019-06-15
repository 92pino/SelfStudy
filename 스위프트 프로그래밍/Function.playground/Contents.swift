import UIKit


var getMail: String = ""

func hello(_ name: String) -> String {
    var name = "pino"
    getMail = "Hello \(name)!"
    return getMail
}

hello("james")
print(getMail)

func helloWorld() -> String {
    
    return "Hello, world!"
}

print(helloWorld())

func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "pino", yourName: "raon"))

func sayHelloWorld() {
    print("hello world")
}

func sayHello(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName)")
}
sayHello(myName: "pino", yourName: "방문자")

typealias CalculateTwoInts = (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result : \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)

func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

printMathResult(chooseMathFunction(false), 3, 5)

typealias MoveFunc = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3

let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로")

while position != 0 {
    print("\(position)")
    position = moveToZero(position)
}
print("원점도착")

// 중첩함수로 만들어보자

