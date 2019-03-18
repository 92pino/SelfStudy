import UIKit

var count = 10
var result = (count > 10) ? true : false
print("result 변수의 값 -> \(result)")

var count2 = 20
var result2: String? = (count2 > 20) ? "Success" : nil
if result2 == nil {
    print("result2 변수의 값은 nil입니다.")
} else {
    print("result2 변수의 값은 \(result2)입니다.")
}

if count is Int {
    print("count 변수의 자료형은 Int입니다.")
} else {
    print("count 변수의 자료형은 Int가 아닙니다.")
}

let name = "pino"
let age = 28

if !(name is String) || !(age is String) {
    print("문자열 자료형이 아닌 것이 있습니다.")
}
