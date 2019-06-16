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

// 프로퍼티 선언 및 초기화
struct CoordinatePoint {
    var x: Int
    var y: Int
}

let pinoPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
    // 현재 사람의 위치를 모를수도 있으므로 옵셔널
    var point: CoordinatePoint?  // 저장 프로퍼티 (변수) - 위치는 변경될 수 있음
    
    let name: String            // 저장 프로퍼티 (상수)
    
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let pinoPosition: Position = Position(name: "pino", currentPoint: pinoPoint)
print(pinoPosition.point, pinoPosition.name)

// 지연 저장 프로퍼티 (Lazy)

struct CoordinatePointLazy {
    var x: Int = 0
    var y: Int = 0
}

class PositionLazy {
    lazy var point: CoordinatePointLazy = CoordinatePointLazy()
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

let lazyPinoPoint: PositionLazy = PositionLazy(name: "pino")
print(lazyPinoPoint.point.x)

// 연산 프로퍼티
// 특정 연산을 실행한 결과값
// 클래스, 구조체, 열거형에 사용



// 타입 프로퍼티
// 특정 타입에 사용되는 프로퍼티


// 프로퍼티 옵저버
// 프로퍼티의 값이 변하는 것을 감지
// 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 액션을 실행
// 저장 프로퍼티에 적용, 부모클래스로부터 상속
