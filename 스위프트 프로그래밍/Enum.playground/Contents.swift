import UIKit

/*:
 ## 열거형
 - 연관된 항목들을 묶어서 표현할 수 있는 타입
    - 제한된 선택지를 주고 싶을 때
    - 정해진 값 외에는 입력받고 싶지 않을 때
    - 예상된 입력 값이 한정되어 있을 때

 ex)
 - 무선통신 방식 : Wifi, 블루투스, LTE, 3G, 기타
 - 학생 : 초등학생, 중학생, 고등학생, 대학생, 대학원생, 기타
 - 지역 : 강원도, 경기도, 경상도, 전라도, 제주도, 충청도
*/
enum School {
    case primary
    case elementry
    case middle
    case high
    case colleage
    case university
    case graduate
}

//var highestEducationLevel: School = School.university

// School.university와 동일한 표현
var highestEducationLevel: School = .university

//값 변경
highestEducationLevel = .graduate

// 특정 타입의 값을 원시 값으로 가지고 싶다면 열거형 이름 오른쪽에 타입 명시
enum School2: String {
    case primary = "유치원"
    case elementry = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case colleage = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel2: School2 = School2.university
// 원시값을 사용하기 위해선 rawValue프로퍼티 사용
print(highestEducationLevel2.rawValue)

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}
let today: WeekDays = .fri
print(today.rawValue)

print(School2.elementry.rawValue)

enum Numbers: Int {
    case zero
    case one
    case two
    case seven
    case ten = 10
}
// Int 타입일 경우 첫 항목을 기준으로 0부터 1씩 증가
print(Numbers.seven.rawValue)
// 문자열 형식의 원시값을 지정했으면 각 항목 이름을 그대로 원시값으로 갖게 된다.

enum School3: String {
    case primary = "유치원"
    case elementry
    case middle
    case high
    case colleage
    case university
    case graduate
}

print(School3.elementry.rawValue)   // elementary 출력

// 열거형이 원시값을 갖는 열거형일 때, 원시값 정보를 안다면 원시값을 통해 열거형 변수 또는 상수를 생성해줄수 있다.
// 원시값을 통한 열거형 초기화
// 만약 원시값이 없을 경우 nil반환
let primary = School3(rawValue: "유치원") // primary
let middle = School3(rawValue: "중학교")  // nil

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}
var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice

enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case cheeseCrust, thin, original
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish2 {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner2: MainDish2 = MainDish2.pasta(taste: PastaTaste.tomato)
dinner2 = .pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)

enum Computer {
    case monitor(monitorIn: School)
    case keyboard
    case mouse
    case power
}

var computer: Computer = Computer.keyboard
print(computer)

computer = .monitor(monitorIn: School.colleage)

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")

let last: School = School.university

switch last {
case .primary:
    print("최종 학력은 \(School.primary)입니다.")
case .elementry:
    print("최종 학력은 \(School.elementry)입니다.")
case .middle:
    print("최종 학력은 \(School.middle)입니다.")
case .high:
    print("최종 학력은 \(School.high)입니다.")
case .colleage:
    print("최종 학력은 \(School.colleage)입니다.")
case .university:
    print("최종 학력은 \(School.university)입니다.")
case .graduate:
    print("최종 학력은 \(School.graduate)입니다.")
}

var names: Set<String> = ["Joker", "Jenny", "Nova", "Pino"]
print(names)

nameLoop: for i in names {
    print(i)
}
        
while names.isEmpty == false {
    print("Good bye \(names.removeFirst())")
}

print(names)
