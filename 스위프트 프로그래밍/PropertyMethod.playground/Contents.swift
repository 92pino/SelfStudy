import UIKit

/***********************************************************************
 Property
 - 저장프로퍼티
 - 연산프로퍼티
 - 타입프로퍼티
 ***********************************************************************/

struct CoordinatePoint {
    
    // 기본적인 저장 프로퍼티
    var x: Int = 0
    var y: Int = 0
    
    // 연산 프로퍼티
    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        
        set {
            x = -newValue.x
            y = -newValue.y
        }
    }
}

// 지연 저장 프로퍼티 (lazy)

class Position {
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let pinoPosition: Position = Position(name: "pino")
print(pinoPosition.name)

var pinoPosition2: CoordinatePoint = CoordinatePoint(x: 10, y: 20)
print(pinoPosition2)
print(pinoPosition2.oppositePoint)

// set이 있을 경우 값 변경 가능
pinoPosition2.oppositePoint = CoordinatePoint(x: 15, y: 10)
print(pinoPosition2)

struct Point {
    // 저장 프로퍼티
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            
            return Point(x: centerX, y: centerY)
        }
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
print(square.center)
let initSquareCenter = square.center
print(initSquareCenter)


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
            print(1111)
            return Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.+")
        }
    }
}

class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

//let myAccount: Account = Account()
//print(myAccount.credit)

// 값이 변경되는 순간 willSet didSet 적용됨
//myAccount.credit = 1000
//print(myAccount.dollarValue)


print("시작")
let myAccount2: ForeignAccount = ForeignAccount()
// 잔액이 0원에서 1000원으로 변경될 예정입니다.
myAccount2.credit = 1000
// 잔액이 0원에서 1000원으로 변경되었습니다.

// 값이 할당이 되면 부모 클래스의 프로퍼티 감시자 먼저 실행됨
// 여기에선 Account 클래스의 willSet didSet 순으로 실행

// 잔액이 1.0달러에서 2.0달러로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경되었습니다.
myAccount2.dollarValue = 2
// 잔액을 2.0달러로 변경 중입니다.
// 잔액이 1.0달러에서 2.0달러로 변경되었습니다.
// ForeignAccount의 dollarValue에 값이 할당되면 그때 프로퍼티 감시자 실행
//


class Company {
    var _members: Int?
    var members: Int {
        get {
            
            return _members ?? 0
        }
        
        set {
            if newValue < 1 {
                print("직원 수는 1명보다 적을 수 없습니다.")
            } else {
                print("직원 수는 \(newValue)")
                _members = newValue
            }
        }
    }
}

var company = Company()
company.members = 5

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("totalSteps을 \(newTotalSteps)로 설정하려고 합니다.")
        }
        
        didSet(oldTotalSteps) {
            if totalSteps > oldTotalSteps {
                print("\(totalSteps - oldTotalSteps)걸음이 추가되었습니다.")
            }
        }
    }
}

let stepCounter = StepCounter()
print("첫번째 값 할당")
stepCounter.totalSteps = 200
print("첫번째 값 할당 끝")
print("두번째 값 할당")
stepCounter.totalSteps = 360
print("두번째 값 할당 끝")

var wonInPocket: Int = 2000 {
    willSet {
        print(wonInPocket, newValue)
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)로 변경될 예정입니다.")
    }
    
    didSet {
        print(oldValue, wonInPocket)
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double {
    get {
        return Double(wonInPocket)
    }
    
    set {
        wonInPocket = Int(newValue * 1000.0)
        print(wonInPocket)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

dollarInPocket = 3.5

///////////////////////////////////////////////////////////////////////////////////////////////////

class AClass {
    static var typeProperty: Int = 0
    
    var instanceProperty: Int = 0 {
        didSet {
            AClass.typeProperty = instanceProperty + 100
        }
    }
    
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)
