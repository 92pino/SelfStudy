import UIKit
//
//////// 기본적인 함수 정의 형식
//////
////////func 함수이름 (매개변수1: 타입, 매개변수2: 타입. 매개변수3: 타입, ...) -> 반환타입 {
////////
////////    실행내용
////////
////////    return 반환값
////////
////////}
//////
//////
//////// 1. 매개변수와 반환값이 모두 없는 함수
//////func printHello() {
//////    print("안녕하세요")
//////}
//////printHello()
//////
//////// 2. 매개변수(파라미터)가 없지만 반환값은 있는 함수
//////func sayHello() -> String {
//////    let returnValue = "안녕하세요"
//////    return returnValue
//////}
//////print(sayHello())
//////
//////// 3. 매개변수는 있으나 반환값은 없는 함수
//////func printHelloWithName(name: String) {
//////    print("\(name)님, 안녕하세요")
//////}
//////let inputName: String = "pino"
//////printHelloWithName(name: inputName)
//////
//////// 4. 매개변수와 반환값이 모두 있는 함수
//////func sayHelloWithName(name: String) -> String {
//////    let returnValue = "\(name)님, 안녕하세요"
//////    return returnValue
//////}
//////print(sayHelloWithName(name: "pino"))
//////
//////
//////func incrementBy(amount: Int, numberOfTimes: Int) {
//////    var count = 0
//////    count = amount * numberOfTimes
//////}
//////incrementBy(amount: 5, numberOfTimes: 2)
//////
//////
//////func times(x: Int, y: Int) -> Int {
//////    return (x * y)
//////}
//////times(x: 5, y: 10)
//////
//////// 함수는 하나의 값만을 반환해야한다.
//////
//////func getIndvInfo() -> (Int, String) {
//////    let height = 180
//////    let name = "pino"
//////
//////    return (height, name)
//////}
//////
////////func getUserInfo() -> (Int, Character, String) {
////////    let gender: Character = "M"
////////    let height = 180
////////    let name = "pino"
////////
////////    return (height, gender, name)
////////}
////////
////////var uInfo = getUserInfo()
////////uInfo.0
////////uInfo.1
////////uInfo.2
////////
////////var (a,b,c) = getUserInfo()
////////a
////////b
////////c
//////
////////func getUserInfo() -> (h: Int, g: Character, n: String) {
////////    let gender: Character = "M"
////////    let height = 180
////////    let name = "pino"
////////
////////    return (height, gender, name)
////////}
////////
////////var result = getUserInfo()
////////result.h
////////result.g
////////result.n
//////
//////// 타입 얼라이언스
//////// 특정 튜플이 여러 곳에서 사용될 경우 새로운 축약형 타입을 정의
//////// typealias <새로운 타입 이름> = <타입 표현>
//////
//////typealias infoResult = (Int, Character, String)
//////
//////func getUserInfo() -> infoResult {
//////    let gender: Character = "M"
//////    let height = 180
//////    let name = "꼼꼼한 재은씨"
//////
//////    return (height, gender, name)
//////}
//////
//////let info = getUserInfo()
//////
//////info.0
//////info.1
//////info.2
//
//// 매개변수
///*
//    func 함수명(<외부 매개변수명> <내부 매개변수명>: <타입>, <외부 매개변수명> <내부 매개변수명>: <타입> ...) {
//        // 함수의 내용이 작성되는 곳
//    }
//*/
//
////func printHello(to name: String, welcomeMessage msg: String) {
////    print("\(name)님, \(msg).")
////}
////printHello(to: "pino", welcomeMessage: "Hello")
////
////// 외부 매개변수 생략
////func printHello2(_ name: String, _ msg: String) {
////    print("\(name)님, \(msg).")
////}
////printHello2(_:"pino", "hello")
////
////
////// 가변 인자
////
//////func 함수명(매개변수명 : 매개변수 타입 ...)
////
////func avg(score: Int ...) -> Double {
////    var total = 0   // 점수 합계
////    for r in score {
////        total += r
////    }
////    return (Double(total) / Double(score.count))
////}
////print(avg(score: 10, 20, 30, 40))
////// total = 100
////// score.count = 4
////
////// 기본값을 갖는 매개변수
////func echo(message: String, newline: Bool = true) {
////    if newline == true {
////        print(message, true)
////    } else {
////        print(message, false)
////    }
////}
////echo(message: "pino")   // default newline 값이 true로 기본값을 갖고 있으므로 실행 된다.
////echo(message: "pino", newline: true)
////echo(message: "pino", newline: false)
////
////// 매개변수 수정
////func descAge(_ name: String, _ paramAge: Int) -> String {
////    var name = name
////    var paramAge = paramAge
////
////    name = name + "씨"
////    paramAge += 1
////
////    return "\(name)의 내년 나이는 \(paramAge)세입니다"
////}
////descAge(_: "pino", _: 10)
////
////// InOut 매개변수
////
////var cnt = 30
////print(cnt)
////
////func autoIncrement(value: Int) -> Int {
////    var value = value
////    value += 1
////
////    return value
////}
////
////print(autoIncrement(value: cnt))
////print(cnt)
////
////
////var count = 30
////print(count)
////func foo(paramCount: inout Int) -> Int {
////    paramCount += 1
////    return paramCount
////}
////
////print(foo(paramCount: &count))
////print(count)
////
///*
//     값에 의한 전달
//     내부적으로 복사를 통해 새로운 변수나 상수를 이용하여 함수의 기능을 실행하므로 인자값의 수정이 발생하더라도 원본 값에는 영향이 없다
//
//     참조에 의한 전달
//     외부의 인자값을 직접 참조하므로 함수 내부에서 인자값이 변경이 되면 그 결과가 원본 값에도 변경이 된다.
//     대표적으로 inout, class로 구현된 인스턴스
// */
//
////// 변수의 생명주기
//
////do {
////    do {
////        var ccnt = 3
////        ccnt += 1
////        print(ccnt)
////    }
//////    ccnt += 1
//////    print(ccnt)
////}
////
////do {
////    var ccnt = 0
////    print(ccnt)
////    do {
////        ccnt = 3
////        print(ccnt)
////    }
////    ccnt += 1
////    print(ccnt)
////}
////
//
//var count = 30
//print(count)
//
//func foo(paramCount: inout Int) -> Int {
//    var count = paramCount  // foo 함수 내부에 전역 변수와 이름 및 타입이 동일한 매개변수를 정의
//    count += 1
//    return count
//}
//
//print(foo(paramCount: &count))
//print(count)    // 값이 변경되지 않음
//
//var count2 = 30
//print(count2)
//func foo2(paramCount2: inout Int) -> Int {
//    count2 += 1
//    return count2
//}
//print(foo2(paramCount2: &count))
//print(count2)   // 값이 변경됨
//
//// 일급 객체로서의 함수
//// 1. 변수나 상수에 함수를 대입할 수 있음
//func test1(base: Int) -> String {
//    return "결과값은 \(base + 1)입니다"
//}
////let fn1 = test1(base: 5)
//
//
//// 2. 함수의 반환 타입으로 함수를 사용할 수 있음
//func desc() -> String {
//    return "this is desc()"
//}
//
//func pass() -> () -> String {
//    return desc
//}
//let p = pass()
//p()
//
//func test() -> String {
//    func test2() -> String {
//        return "this is test()"
//    }
//    return test2()
//}
//let a = test()
//
//
//func plus(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//func minus(a: Int, b: Int) -> Int {
//    return a - b
//}
//
//func times(a: Int, b: Int) -> Int {
//    return a * b
//}
//
//func divide(a: Int, b: Int) -> Int {
//    guard b != 0 else {
//        return 0
//    }
//    return a / b
//}
//
//func calc(_ operand: String) -> (Int, Int) -> Int {
//    switch operand {
//    case "+" :
//        return plus
//    case "-" :
//        return minus
//    case "*" :
//        return times
//    case "/" :
//        return divide
//    default :
//        return plus
//    }
//}
//
//let c = calc("+")
//c(3,4)
//
//// 3. 함수의 인자값으로 함수를 사용할 수 있음
//func incr(param: Int) -> Int {
//    return param + 1
//}
//
//func broker(base: Int, function fn: (Int) -> Int) -> Int {
//    return fn(base)
//}
//
//broker(base: 3, function: incr)
//
//// 콜백 함수
//
//func successThrough() {
//    print("연산 처리가 성공했습니다.")
//}
//
//func failThrough() {
//    print("처리 과정에 오류가 발생하였습니다.")
//}
//
//func divide(base: Int, success sCallBack: () -> Void, fail fCallBack: () -> Void) -> Int {
//    guard base != 0 else {
//        fCallBack()
//        return 0
//    }
//    defer {
//        /*
//             defer 구문
//             작성된 위치와 순서에 상관없이 함수가 종료되기 전에 실행된다.
//             defer를 읽기 전 함수의 실행이 종료될 경우 defer 구문은 실행되지 않는다.
//             여러개의 defer 블록이 있을경우 마지막 defer부터 역순으로 실행
//             중첩 사용이 가능하며 바깥 -> 안쪽 순으로 실행(가장 안쪽에 있는 블록이 마지막에 실행)
//         */
//        sCallBack()
//    }
//    return 100 / base
//}
//
//divide(base: 0, success: successThrough, fail: failThrough)
//
//// 함수의 중첩
////func outer(base: Int) -> String {
////
////    func inner(inc: Int) -> String {
////        return "\(inc)를 반환합니다."
////    }
////
////    let result = inner(inc: base + 1)
////    return result
////}
////
////outer(base: 3)
//
//// 외부함수
//
//func outer(param: Int) -> (Int) -> String {
//
//    // 내부함수
//    func inner(inc: Int) -> String {
//        return "\(inc)를 리턴합니다."
//    }
//
//    return inner
//}
//
//let fn1 = outer(param: 3)
//let fn2 = fn1(30)
//
//func basic(param: Int) -> (Int) -> Int {
//    let value = param + 20
//
//    func append(add: Int) -> Int {
//        return value + add
//    }
//
//    return append
//}
//
////let result = basic(param: 10)
////result(10)
//
//// 클로저
//
///*
//    1. 전역 함수 == 이름이 있으며, 주변 환경에서 캡처할 어떤 값도 없는 클로저
//    2. 중첩 함수 == 이름이 있으며, 자신을 둘러싼 함수로부터 값을 캡처할 수 있는 클로저
//    3. 클로저 표현식 == 이름이 없으며, 주변 환경으로부터 값을 캡처할 수 있는 경량 문법으로 작성된 클로저
//*/
//
//// 클로저 표현식
///*
// { (매개변수) -> 반환 타입 in
//    실행할 구문
//}
// */
//
////{ () -> () in
////    print("클로저가 실행됩니다.")
////}
//
///*
//
// 같은 방식으로 빈 괄호로 작성된 반환 타입은 타입 알리어스로 작성된 문자열 void를 이용하여 표현할수도 있다.
//
//*/
//
////{ () -> Void in
////    print("클로저가 실행됩니다.")
////}
//
//
//// 클로저가 실행되는 방법 1
//
//let f = { () -> Void in
//    print("클로저가 실행됩니다.")
//}
//f()
//
//// 클로저가 실행되는 방법 2
//({ () -> Void in
//    print("클로저가 실행됩니다.")
//})()
//
//// 매개변수가 있는 형태의 클로저 표현식
//let c2 = { (s1: Int, s2: String) -> Void in
//    print("s1: \(s1), s2: \(s2)")
//}
//
//print(c2(1, "closure"))
//
////{(s1: Int, s2: String) -> Void in
////    print("s1: \(s1), s2: \(s2)")
////})(1, "closure")


var valueSort = [1, 9, 5, 7, 3, 2]

func order(s1: Int, s2: Int) -> Bool {
    if s1 > s2 {
        return true
    } else {
        return false
    }
}
//print(valueSort.sort(by: order))

//{    (s1: Int, s2: Int) -> Bool in
//
//    if s1 > s2 {
//        return true
//    } else {
//
//        return false
//    }
//}
/*
func avg(score: Int...) -> Double {
    var total = 0
    for r in score {
        total += r
    }
    return(Double(total) / Double(score.count))
}

print(avg(score: 10, 20, 30, 40))
*/

func echo(message: String, newline: Bool = true) {
    if newline == true {
        print(message, true)
    } else {
        print(message, false)
    }
}
echo(message: "테스트입니다.")


typealias infoResult = (h: Int, g: Character, n: String)

func getUserInfo() -> infoResult {
    let gender: Character = "M"
    let height = 180
    let name = "Pino"
    
    return (height, gender, name)
}

let info = getUserInfo()

func incrementBy(base: Int) -> Int {
    var base = base
    base += 1
    return base
}
incrementBy(base: 10)

func descAge(name: String, _ paramAge: Int) -> String {
    var name = name
    var paramAge = paramAge
    
    name = name + "씨"
    paramAge += 1
    
    return "\(name)의 내년 나이는 \(paramAge)세입니다"
}
descAge(name: "Pino", 28)
