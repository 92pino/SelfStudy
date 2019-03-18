import UIKit

class Person {
    var name: String?
    
    // 새로운 객체를 만들 때 초기 데이터를 같이 넣을 수 있게 초기화하는 초기화 함수 init()
    init() {
        name = ""
    }
//    init(inName: String) {
//        name = inName
//    }
    
    // inName과 동일한 초기화 기능
    init(name: String) {
        self.name = name
    }
    
    func walk(speed: Int) {
        print("\(name)이(가) \(speed)km 속도로 걸어갑니다.")
    }
    
    func run(speed: Int) {
        print("사람이 \(speed)km 속도로 뛰어갑니다.")
    }
}
var jack = Person()
jack.walk(speed: 10)

var mike = Person()
mike.walk(speed: 10)

var pino = Person()
pino.walk(speed: 10)

var person01 = Person()
person01.name = "pino"
person01.walk(speed: 104)

var person02 = Person()
person02.name = "raon"
person02.walk(speed: 20)

var person03 = Person()
person03.name = "yagom"

Person.init()
person03.walk(speed: 24)

class Dog {
    var name: String = ""
    
    func walk() {
        print("\(name)가 걸어갑니다.")
    }
}
var myDog = Dog()
myDog.name = "만두"
myDog.walk()



person01 = Person(name: "철수")
person01.walk(speed: 10)

person02 = Person(name: "영희")
person02.walk(speed: 20)

person03 = Person(name: "민희")
person03.walk(speed: 24)

var person04 = person03
person04.walk(speed: 30)
person03.name = "수진"
person03.name
person04.name = "수지"

person04.walk(speed: 30)

func changePerson(person: Person) {
    person.name = "진경"
}
person04.walk(speed:50)
changePerson(person: person03)
person04.walk(speed: 40)

struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width
cinema.width = 2048
hd.width
cinema.width
print("\(cinema.width)")
