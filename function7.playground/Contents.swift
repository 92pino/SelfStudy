import UIKit

func show(value1: String) {
    var value2: Int?
    print(value2)
    value2 = Int(value1)
    print("전달 받은 숫자 -> \(value2!)")
}
show(value1: "10")

func show2(value1: String) {
    var value2: Int?
    value2 = Int(value1)
    print(value2)
    
    if value2 == nil {
        print("전달 받은 값은 숫자가 아닙니다.")
    } else {
        print("전달 받은 숫자 -> \(value2!)")
    }
}
show2(value1: "10")  // value2가 Int("10")이므로 value2 == 10
show2(value1: "안녕") // value2가 Int("안녕")가 되므로 nil값이 된다.

func show3(value1: String) -> Int? {
    var value2: Int?
    value2 = Int(value1)
    
    if value2 == nil {
        print("전달 받은 값은 숫자가 아닙니다.")
    } else {
        print("전달 받은 숫자 -> \(value2!)")
    }
    
    return value2
}
var result = show3(value1: "10")
print("show3 함수 호출 결과 -> \(result)")

result = show3(value1: "안녕")
print("show3 함수 호출 결과 -> \(result)")

func divide(_ a: Int, _ b: Int) -> Int? {
    if b == 0 {
        return nil
    }
    
    return a / b
}
let result1 = divide(20, g0)
let result2 = divide(10, 0)
print("나누기 결과 : \(result1), \(result2)")


