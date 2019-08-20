import UIKit

/*:
 ---
 ## Optional이란?
 - 값이 있을수도 있고, 없을수도 있음을 나타내는 표현
 - 변수 또는 상수 값이 'nil'일 수도 있다.
 */	

//var myName: String = "pino"
//myName = nil    // 오류 발생

//var myName: String? = "pino"
//print(myName)
//
//myName = nil
//
//print(myName)

func checkOptionalValue(value OptionalValue: Any?) {
    switch OptionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName: String? = "pino"
checkOptionalValue(value: myName)

//myName = nil
checkOptionalValue(value: myName)

var name: String? = "pino"
print(name)

var pino: String! = name
print(pino)

//myName = nil
//pino = myName!

// 옵셔널 해제 방법
// 1. 옵셔널 강제 추출
// 옵셔널 값의 뒤에 느낌표를 붙여준다.
if myName != nil {
    print("My name is \(myName!)")
} else {
    print("myName == nil")
}

// 2. 옵셔널 바인딩
// 옵셔널에 값이 있을 경우 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당

var bindMyName: String? = "pino"

if let name = bindMyName {
    print("My name is \(bindMyName)")
} else {
    print("bindMyName == nil")
}

if var bindMyName2 = myName {
    name = "wizplan"
    print("My name is \(name)")
} else {
    print("myName == nil")
}
