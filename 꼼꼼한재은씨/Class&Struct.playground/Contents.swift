import UIKit

struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    var res = Resolution()
    
    func desc() -> String {
        return "VideoMode 클래스"
    }
}

// 인스턴스를 만드는 과정
// Resolution 구조체에 대한 인스턴스를 생성하고 insRes라는 상수에 할당
let insRes = Resolution()
// VideoMode 클래스에 대한 인스턴스를 생성하고 insVMode라는 상수에 할당
let insVMode = VideoMode()

/*

 프로퍼티에 접근 할 때 == <인스턴스 이름>.<프로퍼티 이름>
 서브 프로퍼티에 접근 == <인스턴스 이름>.<프로퍼티 이름>.<프로퍼티의 서브 프로퍼티 이름>
 
*/
let width = insRes.width

// VideoMode 클래스에 대한 인스턴스를 생성하고 vMode 상수에 할당
let vMode = VideoMode()
print("vMode 인스턴스의 width 값은 \(vMode.res.width)")

vMode.name = "Sample"
vMode.res.width = 1280

/*
 
    오브젝티브-C에서는 체인 형식으로 연달아 하위 속성에 접근할 수 있는 구문을 지원하지 않으므로
 
    var res = vMode.res
    res.width = 1280
 
    다음과 같이 할당을 해야한다.
*/

/*

    옵셔널 타입으로 선언되지 않은 모든 프로퍼티는 명시적으로 초기화해 주어야 하는데 초기화되지 않은 프로퍼티가 있을 경우 컴파일러는 이를 컴파일 오류로 처리해서 앱이 빌드되지 못하게 한다.
 
    ** 명시적 초기화란
        1. 프로퍼티를 선언하면서 동시에 초기값을 지정하는 경우
        2. 초기화 메소드 내에서 프로퍼티의 초기값을 지정하는 경우
 
*/

let defaultRes = Resolution(width: 1024, height: 768)
defaultRes.width
defaultRes.height

var hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 1000
cinema.width
hd.width

let video = VideoMode()
video.name = "Original Video Instance"
print("video 인스턴스의 name 값은 \(video.name!)입니다.")

let dvd = video
dvd.name = "DVD Video Instance"
dvd.name
video.name

func changeName(v: VideoMode) {
    v.name = "Function Video Instance"
}
changeName(v: video)
video.name

if video === dvd {
    print("1111")
} else {
    print("2222")
}

let vs = VideoMode()
let ds = VideoMode()

if vs !== ds {
    print("1111")
}

// 1. 초기화 구문을 작성하고, 그 안에서 초기값을 할당
class User {
    var name: String
    
    init() {
        self.name = ""
    }
}

// 2. 프로퍼티를 옵셔널 타입으로 바꿔준다.

class User2 {
    var name: String?
    var age: Int!
}

// 3. 프로퍼티에 초기값을 할당
class User3 {
    var name: String = ""
}

// 구조체에서 저장 프로퍼티
struct FixedLengthRange {
    var startValue: Int // 시작값
    let length: Int     // 값의 범위
}

// 가변 길이 범위 구조체
struct FlexibleLengthRange {
    let startValue: Int // 시작값
    var length: Int     // 값의 범위
}

// 0부터 시작해서 값의 범위 3 ==> 0,1,2
var rangeOfFixedIntegers = FixedLengthRange(startValue: 0, length: 3)
// 시작점을 4로 변경 ==> 4,5,6
rangeOfFixedIntegers.startValue = 4

// 0부터 시작해서 값의 범위 3 ==> 0,1,2
var rangeOfFlexibleIntegers = FlexibleLengthRange(startValue: 0, length: 3)
// 값의 범위를 5로 변경 ==> 0,1,2,3,4
rangeOfFlexibleIntegers.length = 5

// 변수에 할당된 구조체 인스턴스
var variablesOfInstance = FixedLengthRange(startValue: 3, length: 4)
// 변수에 할당되 저장 프로퍼티 수정 가능
variablesOfInstance.startValue = 0

// 상수에 할당된 구조체 인스턴스
let constantsOfInstance = FixedLengthRange(startValue: 3, length: 4)
// 상수에 저장되어 있으므로 저장 프로퍼티 수정 불가능
//constantsOfInstance.startValue = 0


class OnCreate {
    init() {
        print("OnCreate!!")
    }
}

class LazyTest {
    var base = 0
    lazy var late = OnCreate()
    
    init() {
        print("Lazy Test")
    }
}

let lz = LazyTest()
lz.late

/*
 
     let/var 프로퍼티명: 타입 = {
        정의 내용
        return 반환값
     }()
 
*/

class PropertyInit {
    
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    var value01: String! = {
        print("value01 execute")
        return "value01"
    }()
    
    // 저장 프로퍼티 - 인스턴스 생성 시 최초 한 번만 실행
    let value02: String! = {
        print("value02 execute")
        return "value02"
    }()
    
    lazy var value03: String! = {
        print("value03 execute")
        return "value03"
    }()
}

//let s = PropertyInit()
//
//let s1 = PropertyInit()
//s1.value03

/*

 class/struct/enum 객체명 {
    ...
     var 프로퍼티명: 타입 {
         get {
            필요한 연산 과정
            return 반환값
         }
         // 선택적 생략 가능
         set(매개변수명) {
            필요한 연산구문
         }
     }
 }
 
*/

struct UserInfo {
    // 저장 프로퍼티 : 태어난 연도
    var birth: Int!
    
    // 연산 프로퍼티 : 올해가 몇년도인지 계산
    var thisYear: Int? {
        get {
            let df = DateFormatter()
            df.dateFormat = "yyyy"
            return Int(df.string(from: Date()))
        }
    }
    
    // 연산 프로퍼티 : 올해 - 태어난 연도 + 1
    var age: Int {
        get {
            return (self.thisYear! - self.birth) + 1
        }
    }
}

let info = UserInfo(birth: 1992)
info.age

struct Rect {
    var originX: Double = 0.0, originY: Double = 0.0
    
    var sizeWidth: Double = 0.0, sizeHeight: Double = 0.0
    
    var centerX: Double {
        get {
            return self.originX + (sizeWidth / 2)
        }
        set{
            originX = newValue - (sizeWidth / 2)
        }
    }
    
    var centerY: Double {
        get {
            return self.originY + (self.sizeHeight / 2)
        }
        set(newCenterY) {
            originY = newCenterY - (sizeHeight / 2)
        }
    }
}
var square = Rect(originX: 0.0, originY: 0.0, sizeWidth: 10.0, sizeHeight: 10.0)
square.centerX
square.originX
square.centerX = 20
square.originX

square.centerX


print("===============결과값===============")
print(square.centerX)
print(square.centerY)

print("===============결과값===============")

struct NewPosition {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct NewSize {
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Rect2 {
    var newOrigin = NewPosition()
    var newSize = NewSize()
    
    var newCenter: NewPosition {
        get {
            let newCenterX = self.newOrigin.x + (self.newSize.width / 2)
            let newCenterY = self.newOrigin.y + (self.newSize.height / 2)
            return NewPosition(x: newCenterX, y: newCenterY)
        }
        /*
            읽기 전용으로 설정된 연산 프로퍼티는 get블록을 생략할 수도 있다.
             let newCenterX = self.newOrigin.x + (self.newSize.width / 2)
             let newCenterY = self.newOrigin.y + (self.newSize.height / 2)
             return NewPosition(x: newCenterX, y: newCenterY)
        */
    }
}

let p = NewPosition(x: 0.0, y: 0.0)
let s = NewSize(width: 10.0, height: 10.0)
var square2 = Rect2(newOrigin: p, newSize: s)

// get만 있고 set은 없을 경우 읽기 전용 프로퍼티로 생성된다.
/*
 
    willSet 옵저버
 
    var <프로퍼티명> : <타입> [ = <초기값> ] {
        willSet [ (<인자명>) ] {
            <프로퍼티 값이 변경되기 전에 실행할 내용>
        }
    }
 
    didSet 옵저버
 
    var <프로퍼티명> : <타입> [ = <초기값> ] {
        didSet [ (<인자명>) ] {
           <프로퍼티 값이 변경된 후에 실행할 내용>
        }
    }
 
*/

struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("이번달 월급은 \(newIncome)원입니다.")
        }
        didSet {
            if income > oldValue {
                print("월급이 \(income - oldValue)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드리 않아요.")
            }
        }
    }
}

var job = Job(income: 1000)
job.income = 100000


struct Resolution1 {
    var width = 0
    var height = 0
    
    func desc() -> String {
        let desc = "이 해상도는 가로 \(self.width) X \(self.height) 로 구성됩니다."
        return desc
    }
    
    func judge() -> Bool {
        let width = 30
        return self.width == width
    }
}

class VideoMode1 {
    var resolution = Resolution1()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
    
    func desc() -> String {
        if self.name != nil {
            let desc = "이 \(self.name!) 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        } else {
            let desc = "이 비디오 모드는 \(self.frameRate)의 프레임 비율로 표시됩니다."
            return desc
        }
    }
}
let test22 = Resolution1()
test22.judge()

class Counter {
    var count = 0
    
    // 카운트를 1 증가
    func increment() {
        self.count += 1
    }
    
    // 입력된 값만큼 카운트를 증가
    func incrementBy(amount: Int) {
        self.count += amount
    }
    
    func reset() {
        self.count = 0
    }
}
let test33 = Counter()
test33.increment()
test33.count
test33.incrementBy(amount: 10)
test33.count
test33.reset()
test33.count

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}
var point = Point(x: 10.5, y: 12.0)
point.moveByX(x: 3.0, y: 4.5)
point.x
point.y

class Location {
    var x = 0.0, y = 0.0
    
    func moveByX(x deltaX: Double, y deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var loc = Location()
loc.x = 10.5
loc.y = 12.0
loc.moveByX(x: 3.0, y: 4.5)
loc.x
loc.y

class A {
    var name = "class A"
    
    var description: String {
        return "This class name is \(self.name)"
    }
    
    func foo() {
        print("\(self.name)'s method foo is called")
    }
}

let a = A()
a.name
a.description
a.foo()

class B : A {
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }
}
let b = B()
b.prop
b.boo()
b.name
b.foo()

b.name = "Class C"
b.foo()

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다"
    }
    
    func makeNoise() {
        // 임의의 교통수단 자체는 경적을 울리는 기능이 필요없습니다.
    }
}
print("========================= 결과1 =========================")
let baseVehicle = Vehicle()
print("baseVehicle의 description : \(baseVehicle.description)")
print("baseVehicle의 currentSpeed : \(baseVehicle.currentSpeed)")
print("baseVehicle의 makeNoise : \(baseVehicle.makeNoise())")

class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()

print("========================= 결과2 =========================")
print("bicycle의 currentSpeed : \(bicycle.currentSpeed)")
print("bicycle의 description : \(bicycle.description)")
print("bicycle의 makeNoise : \(bicycle.makeNoise())")
print("bicycle의 hasBasket : \(bicycle.hasBasket)")
bicycle.hasBasket = true
bicycle.hasBasket

bicycle.currentSpeed = 20.0
bicycle.description

print("========================= 결과 =========================")
print("bicycle의 currentSpeed : \(bicycle.currentSpeed)")
print("bicycle의 description : \(bicycle.description)")
print("bicycle의 makeNoise : \(bicycle.makeNoise())")
print("bicycle의 hasBasket : \(bicycle.hasBasket)")

class Tandem: Bicycle {
    var passengers = 0
}

let tandem = Tandem()

tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 14.0

print("========================= 결과 =========================")
print("tandem의 currentSpeed : \(tandem.currentSpeed)")
print("tandem의 description : \(tandem.description)")
print("tandem의 makeNoise : \(tandem.makeNoise())")
print("tandem의 hasBasket : \(tandem.hasBasket)")
print("tandem의 passengers : \(tandem.passengers)")


// 오버라이딩
class Car: Vehicle {
    var gear = 0
    var engineLevel = 0
    
    override var currentSpeed: Double {
        get {
            return Double(self.engineLevel * 50)
        }
        set {
            // 아무것도 하지 않음
        }
    }
    override var description: String {
        get {
            return "Car : engineLevel = \(self.engineLevel), so currentSpeed = \(self.currentSpeed)"
        }
        set {
            print("New Value is \(newValue)")
        }
    }
}

let car = Car()
car.engineLevel = 5
car.currentSpeed
car.description = "New Class Car"

print("========================= 결과 =========================")
print("car의 engineLevel : \(car.engineLevel)")
print("car의 currentSpeed : \(car.currentSpeed)")
print("car의 description : \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            self.gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 10.0

