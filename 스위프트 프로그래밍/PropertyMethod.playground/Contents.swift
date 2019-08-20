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
//struct CoordinatePoint {
//    var x: Int
//    var y: Int
//}
//
//let pinoPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)
//
//class Position {
//    // 현재 사람의 위치를 모를수도 있으므로 옵셔널
//    var point: CoordinatePoint?  // 저장 프로퍼티 (변수) - 위치는 변경될 수 있음
//
//    let name: String            // 저장 프로퍼티 (상수)
//
//    init(name: String, currentPoint: CoordinatePoint) {
//        self.name = name
//        self.point = currentPoint
//    }
//}
//
//let pinoPosition: Position = Position(name: "pino", currentPoint: pinoPoint)
//print(pinoPosition.point, pinoPosition.name)
//
//// 지연 저장 프로퍼티 (Lazy)
//
//class DataImporter {
//    // DataImporter는 외부에서 데이터를 가져오는 클래스로 초기화 하는데 매우 많은 시간이 소요된다고 가정합니다.
//    var filename = "data.txt"
//    // 외부 파일명은 "data.txt"
//}
//
//class DataManager {
//    lazy var importer = DataImporter()
//    var data = [String]()
//}
//
//let manager = DataManager() // DataManager의 인스턴스를 생성 (이미 초기화가 되어있어서 init이 필요없음)
//manager.data.append("Some data") // DataManager의 data 배열에 "Some data"를 append시킨다.
//manager.data.append("Some more data") // DataManager의 data 배열에 "Some more data"를 또 append시킨다.
//// 하지만 DataImporter 인스턴스는 이 시점에 생성돼 있지 않습니다.
//
//print(manager.importer.filename)
//
//print(manager.data)
//
//struct CoordinatePoint2 {
//    var x: Int = 0
//    var y: Int = 0
//}
//
//class Position2 {
//    lazy var point: CoordinatePoint2 = CoordinatePoint2()
//    let name: String
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let pinoPosition2: Position2 = Position2(name: "pino")
//print(pinoPosition2.point)
//// 연산 프로퍼티
//// 특정 연산을 실행한 결과값
//// 클래스, 구조체, 열거형에 사용
//
//struct CoordinatePoint3 {
//    var x: Int
//    var y: Int
//
//    var oppositePoint: CoordinatePoint3 {
//        // 접근자
//        get {
//            return CoordinatePoint3(x: -x, y: -y)
//        }
//
//        // 설정자
//        set {
//            print("newValue :", newValue)
//            x = -newValue.x
//            y = -newValue.y
//        }
//    }
//}
//
//var pinoPosition3: CoordinatePoint3 = CoordinatePoint3(x: 10, y: 20)
//
//print("1 : ", pinoPosition3)
//print("2 : ", pinoPosition3.oppositePoint)
//pinoPosition3.oppositePoint = CoordinatePoint3(x: 15, y: 10)
//print("3 : ", pinoPosition3)

class Point {
    // 연산한 값을 저장할 변수 tempX에 임의의 값 지정
    // tempX의 값은 의미없는값???
    var tempX: Int = 5
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
var p: Point = Point()
p.x = 12
print(p.tempX)

class ComputedProperty {
    var width = 5.0
    var height = 5.0
    
    // lazyArea는 직접적으로 값을 바꾸지 않는 이상 초기 결과값을 계속 반환한다.
    // computed는 작성 할 때마다 값을 다시 계산해서 결과값을 반환한다.
    lazy var lazyArea = width * height
    var area: Double {
        return width * height
    }
    
    // computed + stored
    // 연산한 값을 저장할 변수
    private var _koreanWon = 0.0
    var wonToDollar: Double {
        get {
            return _koreanWon / 1136.5
        }
        
        set {
            print("newValue :", newValue)
            _koreanWon = newValue
        }
    }
}

var computed = ComputedProperty()
computed.area
computed.lazyArea

computed.width = 10
computed.area
computed.lazyArea

// computed.lazyArea 값을 바꾸면 바꾼 값으로 계속 호출
// 값을 변경하지 않을 경우 기존 값 5.0 * 5.0 ==> 25로 계속 호출
//computed.lazyArea = 50.0
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.width = 20
computed.height = 20
computed.area
computed.lazyArea

computed.wonToDollar
computed.wonToDollar = 10000
computed.wonToDollar

class Company {
    var _member: Int = 5
    var members: Int {
        get {
            return _member
        }
        
        set {
            if (newValue < 1) {
                print("직원수는 1명보다 작을 수 없습니다.")
            } else {
                _member = newValue
            }
        }
    }
}

print(Company().members)

class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double {
        get {
            return Double(credit)
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다")
        }
        
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경될 예정입니다")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()

myAccount.credit = 1000
myAccount.dollarValue = 2

class OnCreate {
    init() {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("lazy Test")
    }
}

let lz = LazyTest()
lz

// 타입 프로퍼티
// 특정 타입에 사용되는 프로퍼티


// 프로퍼티 옵저버
// 프로퍼티의 값이 변하는 것을 감지
// 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 액션을 실행
// 저장 프로퍼티에 적용, 부모클래스로부터 상속
