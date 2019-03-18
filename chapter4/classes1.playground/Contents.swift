import UIKit

var count = 0

func add(a: Int, b: Int) -> Int {
    count += 1
    let output = a + b
    return output
}

func subtract(a: Int, b: Int) -> Int {
    count += 1
    return a - b
}

var result = add(a:20, b: 10)
print("\(result), \(count)")

result = subtract(a: 20, b: 10)
print("\(result), \(count)")

class Calculator {
    var count = 0
    
    func add(a: Int, b: Int) -> Int {
        count += 1
        
        let output = a + b
        return output
    }
    
    func subtract(a: Int, b: Int) -> Int {
        count += 1
        return a - b
    }
}
var calculator1 = Calculator();
result = calculator1.add(a: 20, b: 10)
print("calculator의 add 함수 호출 후 -> \(result), \(calculator1.count)")

class Dog {
    var name: String = "만두"
}
var dog1 = Dog()
dog1.name
