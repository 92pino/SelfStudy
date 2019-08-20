import UIKit

///*:
// ## 구조체
// 구조체의 인스턴스는 값 타입
// 상속 X
// */
//
//struct BasicInformation {
//    var name: String
//    var age: Int
//}
//
//// 구조체를 변수로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 있다.
//var pinoInfo: BasicInformation = BasicInformation(name: "pino", age: 28)
//pinoInfo.age = 29
//pinoInfo.name = "seba"
//
//// 상수로 선언되어서 인스턴스 내부의 프로퍼티 값을 변경할수 없다. (오류 발생)
//let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
//// sebaInfo.age = 100
//// jennyInfo.age = 10
//
///*:
// ## 클래스
// 클래스의 인스턴스는 참조 타입
// 상속 O
//*/
//class Person {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//}
//
//var pino:Person = Person()
//pino.height = 123.4
//pino.weight = 123.4
//
//
//// 클래스에서는 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있다. ==> 참조타입이여서 가능
//let pinkeb:Person = Person()
//pinkeb.height = 123.4
//pinkeb.weight = 123.4
//
//// 클래스 인스턴스의 소멸 deinit
//// 더이상 참조할 필요가 없을 때 메모리에서 해제
//// 이 과정을 소멸이라고 하는데 소멸 되기 직전 deinit라는 메서드 호출
//
//class PersonDeinit {
//    var height: Float = 0.0
//    var weight: Float = 0.0
//
//    deinit {
//        print("PersonDeinit 클래스의 인스턴스가 소멸")
//    }
//}
//
//var pino2: PersonDeinit? = PersonDeinit()
//pino2 = nil
///*:
// ### 구조체와 클래스의 공통점
// - 값을 저장하기 위해 프로퍼티를 정의
// - 기능 실행을 위해 메서드를 정의
// - 서브스크립트 문법을 통해 구조체 또는 클래스가 갖는 값에 접근하도록 서브스크립트를 정의
// - 초기화될 떄의 상태를 지정하기 위해 이니셜라이저를 정의
// - 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장 가능
// - 트정 기능을 실행하기 위해 특정 프로토콜을 준수
//
// ### 구조체와 클래스의 차이점
// - 구조체는 상속 불가
// - 타입캐스팅은 클래스의 인스턴스에만 허용
// - 디이니셜라이저는 클래스의 인스턴스에만 활용 가능
// - 참조 횟수 계산은 클래스의 인스턴스에만 적용
//*/
//struct

struct BasicInformation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

var friendInfo: BasicInformation = yagomInfo

print("yagom's age: \(yagomInfo.age)")
print("frined's age: \(friendInfo.age)")

friendInfo.age = 999

print("yagom's age: \(yagomInfo.age)")
print("frined's age: \(friendInfo.age)")

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
var friend: Person = yagom

print("yagom's height : \(yagom.height)")
print("friend's height : \(friend.height)")

friend.height = 185.5

print("yagom's height : \(yagom.height)")
print("friend's height : \(friend.height)")

func changeBasicInfo(_ info: BasicInformation) {
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
}

func changePersonInfo(_ info: Person){
    info.height = 55.3
}

changeBasicInfo(yagomInfo)

print("yagom's age: \(yagomInfo.age)")
print("frined's age: \(friendInfo.age)")


var yagom2: Person = Person()
let friend2: Person = yagom2
let anotherFriend: Person = Person()

print(yagom2 === friend2)
print(yagom2 === anotherFriend)
print(friend2 !== anotherFriend)
