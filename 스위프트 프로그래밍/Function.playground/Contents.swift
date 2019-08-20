import UIKit

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
