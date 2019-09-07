import UIKit

/*
 struct 구조체명 {
    프로퍼티 & 메서드
 }
*/

struct BasicInfo {
    var name: String
    var age: Int
}

var pinoInfo: BasicInfo = BasicInfo(name: "pino", age: 28)
pinoInfo.age = 100
pinoInfo.name = "test"

var friendInfo: BasicInfo = pinoInfo

print(pinoInfo.age)
print(friendInfo.age)

friendInfo.age = 99

//friendInfo는 값을 복사해왔기 때문에 pinoInfo와 별개의 값을 가진다.
print(pinoInfo.age)
print(friendInfo.age)

/*
 class 클래스명: 부모클래스 명 {
    프로퍼티 & 메서드
 }
*/

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var pino: Person = Person()
pino.height = 123.4
pino.weight = 123.4

let jenny: Person = Person()
jenny.height = 123.4
jenny.weight = 123.4

var friend: Person = pino

print(pino.height)
print(friend.height)

friend.height = 185.5

// friend는 값을 참조하기때문에 기존 pino의 값도 변경된다.
print(pino.height)
print(friend.height)

var yagom: Person? = Person()
yagom = nil





