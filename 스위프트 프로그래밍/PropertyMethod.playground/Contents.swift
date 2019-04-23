import UIKit

/***********************************************************************
 Property
 - 저장프로퍼티
 - 연산프로퍼티
 - 타입프로퍼티
 ***********************************************************************/

// 저장프로퍼티
// 인스턴스의 변수 또는 상수를 의미
// 구조체와 클래스에서만 사용

struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
}
let pinoPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
pinoPoint.x

class Position {
    var point = CoordinatePoint
    let name: String
    
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let pinoPosition: Position = Position(name: "pino", currentPoint: pinoPoint)

// 연산 프로퍼티
// 특정 연산을 실행한 결과값
// 클래스, 구조체, 열거형에 사용

// 타입 프로퍼티
// 특정 타입에 사용되는 프로퍼티


