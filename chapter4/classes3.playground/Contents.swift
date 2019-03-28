import UIKit

class Friend {
    var name: String?
    
    init() {
        print("Friend:init 호출됨")
        name = "Friend"
    }
}

class Person {
    var name: String?
    lazy var group = Friend()
    init(name: String) {
        self.name = name
    }
    func walk(speed: Int) {
        print("\(name)이(가) \(speed)km 속도로 걸어갑니다.")
    }
    func run(speed: Int) {
        print("\(name)이(가) \(speed)km 속도로 뛰어갑니다.")
    }
}

var person01 = Person(name: "pino")
person01.walk(speed: 10)

person01.group
