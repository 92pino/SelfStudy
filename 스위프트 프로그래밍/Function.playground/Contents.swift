import UIKit

// 함수형 프로그래밍 예씨
func doSomething() {
    print("do something")
}

func doAnotherThing() {
    print("do another thing")
}

func excute(tasks: [() -> ()]) {
    for task in tasks {
        task()
    }
}

excute(tasks: [doSomething, doAnotherThing])

func sum(first: Int) -> ((Int) -> Int) {
    return {
        second in first + second
    }
}

sum(first: 10)(5)

/*
func name(parameter...) -> returnType {
 
   print("1234")
 
   return returnType
 
}
 */

func hello(name: String) -> String {
    return "Hello \(name)"
}
let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

func helloWorld() -> String {
    return "Hello, workd!"
}

helloWorld()

func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}
sayHello(myName: "pino", yourName: "yagom")

func sayHello(from myName: String, to yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

sayHello(from: "pino", to: "yagom")

func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    
    return result
}
sayHello("pino", 2)


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
print("원점으로 갑시다.")

while position != 0 {
    print("\(position)... ")
    position = moveToZero(position)
}


print("원점 도착")


func crashAndBurn() -> Never {
    fatalError("Something very, very bad happend")
}

crashAndBurn()

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니다.")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
someFunction(isAllIsWell: false)
