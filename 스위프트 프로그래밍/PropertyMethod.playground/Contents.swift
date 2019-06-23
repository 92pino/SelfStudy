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

class DataImporter {
    // DataImporter는 외부에서 데이터를 가져오는 클래스로 초기화 하는데 매우 많은 시간이 소요된다고 가정합니다.
    var filename = "data.txt"
    // 외부 파일명은 "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager() // DataManager의 인스턴스를 생성 (이미 초기화가 되어있어서 init이 필요없음)
manager.data.append("Some data") // DataManager의 data 배열에 "Some data"를 append시킨다.
manager.data.append("Some more data") // DataManager의 data 배열에 "Some more data"를 또 append시킨다.
// 하지만 DataImporter 인스턴스는 이 시점에 생성돼 있지 않습니다.

print(manager.importer.filename)

print(manager.data)

struct CoordinatePoint2 {
    var x: Int = 0
    var y: Int = 0
}

class Position2 {
    lazy var point: CoordinatePoint2 = CoordinatePoint2()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let pinoPosition2: Position2 = Position2(name: "pino")
print(pinoPosition2.point)
// 연산 프로퍼티
// 특정 연산을 실행한 결과값
// 클래스, 구조체, 열거형에 사용

struct CoordinatePoint3 {
    var x: Int
    var y: Int
    
    var oppositePoint: CoordinatePoint3 {
        get {
            return CoordinatePoint3(x: -x, y: -y)
        }
        
        set {
            print("newValue :", newValue)
            x = -newValue.x
            y = -newValue.y
        }
    }
}

var pinoPosition3: CoordinatePoint3 = CoordinatePoint3(x: 10, y: 20)

print(pinoPosition3)
print(pinoPosition3.oppositePoint)
pinoPosition3.oppositePoint = CoordinatePoint3(x: 15, y: 10)
print(pinoPosition3)

class Point {
    var tempX: Int
    init(tempX: Int) {
        self.tempX = tempX
    }
    var x: Int {
        get {
            print("getValue :", x)
            return x
        }
        
        set {
            print("newValue : ", newValue)
            tempX = newValue * 2
        }
    }
}
var p: Point = Point(tempX: 1)
p.x = 12
print(p.tempX)
// 타입 프로퍼티
// 특정 타입에 사용되는 프로퍼티


// 프로퍼티 옵저버
// 프로퍼티의 값이 변하는 것을 감지
// 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 액션을 실행
// 저장 프로퍼티에 적용, 부모클래스로부터 상속
