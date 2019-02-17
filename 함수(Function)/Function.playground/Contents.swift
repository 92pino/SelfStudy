import UIKit

// 기본적인 함수 정의 형식

//func 함수이름 (매개변수1: 타입, 매개변수2: 타입. 매개변수3: 타입, ...) -> 반환타입 {
//
//    실행내용
//
//    return 반환값
//
//}


// 1. 매개변수와 반환값이 모두 없는 함수
func printHello() {
    print("안녕하세요")
}
printHello()

// 2. 매개변수(파라미터)가 없지만 반환값은 있는 함수
func sayHello() -> String {
    let returnValue = "안녕하세요"
    return returnValue
}
print(sayHello())

// 3. 매개변수는 있으나 반환값은 없는 함수
func printHelloWithName(name: String) {
    print("\(name)님, 안녕하세요")
}
let inputName: String = "pino"
printHelloWithName(name: inputName)

// 4. 매개변수와 반환값이 모두 있는 함수
func sayHelloWithName(name: String) -> String {
    let returnValue = "\(name)님, 안녕하세요"
    return returnValue
}
print(sayHelloWithName(name: "pino"))


func incrementBy(amount: Int, numberOfTimes: Int) {
    var count = 0
    count = amount * numberOfTimes
}
incrementBy(amount: 5, numberOfTimes: 2)


func times(x: Int, y: Int) -> Int {
    return (x * y)
}
times(x: 5, y: 10)

// 함수는 하나의 값만을 반환해야한다.

func getIndvInfo() -> (Int, String) {
    let height = 180
    let name = "pino"
    
    return (height, name)
}

//func getUserInfo() -> (Int, Character, String) {
//    let gender: Character = "M"
//    let height = 180
//    let name = "pino"
//
//    return (height, gender, name)
//}
//
//var uInfo = getUserInfo()
//uInfo.0
//uInfo.1
//uInfo.2
//
//var (a,b,c) = getUserInfo()
//a
//b
//c

//func getUserInfo() -> (h: Int, g: Character, n: String) {
//    let gender: Character = "M"
//    let height = 180
//    let name = "pino"
//
//    return (height, gender, name)
//}
//
//var result = getUserInfo()
//result.h
//result.g
//result.n

// 타입 얼라이언스
// typealias <새로운 타입 이름> = <타입 표현>

typealias infoResult = (Int, Character, String)

func getUserInfo() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "꼼꼼한 재은씨"
    
    return (height, gender, name)
}

let info = getUserInfo()

info.0
info.1
info.2
