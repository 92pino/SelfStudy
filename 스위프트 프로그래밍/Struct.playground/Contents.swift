import UIKit

struct BasicInformation {
    var name: String
    var age: Int
}

// 구조체를 변수로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 있다.
var pinoInfo: BasicInformation = BasicInformation(name: "pino", age: 28)
pinoInfo.age = 29
pinoInfo.name = "seba"

// 상수로 선언되어서 인스턴스 내부의 프로퍼티 값을 변경할수 없다. (오류 발생)
let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
// sebaInfo.age = 100
// jennyInfo.age = 10
