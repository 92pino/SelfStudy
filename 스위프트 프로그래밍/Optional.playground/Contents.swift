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

let numbers: [Int?] = [2, nil, -4, nil, 100]

print(numbers)

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 0:
        print("Large value!! \(value)")
    case .some(let value):
        print("Value : \(value)")
    case .none:
        print("nil이다.")
    }
}

/*:
 switch문으로 wrapped되어있는 nil값을 switch의 .none으로 unwrapped시켜 값이 있는지 nil인지 추출하는 방식인듯
*/

var name: String? = "pino"
print(name)

var pino: String! = name
print(pino)

//myName = nil
//pino = myName!

// 옵셔널 해제 방법
// 1. 옵셔널 강제 추출
// 옵셔널 값의 뒤에 느낌표를 붙여준다.
// 최대한 지양해야하는 방식
// 만약 값이 있음을 확신하고 또 확신했을 때 사용하지만 가급적이면 if let, guard let으로 unwrapped시켜주는게 좋다.
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
print("name은 :", name)
if var bindMyName2 = myName {
    name = "wizplan"
    print("My name is \(name)")
} else {
    print("myName == nil")
}

// 동일한 방식으로 if let 대신 guard let 사용
// guard let의 장점
// if let은 변수 하나를 옵셔널 바인딩 처리해서 if구문 내부에 중첩시켜 처리하는 방식인것에 비해 (상단 예시를 보면 if let으로 name을 옵셔널 바인딩 했지만 name을 다시 print할 경우 옵셔널이 그대로임을 확인 할수 있다.
// guard let의 경우 변수를 우선 옵셔널 바인딩 처리
func funcName() {
    guard let name2 = bindMyName else { return }
    print(name2)
}

funcName()
