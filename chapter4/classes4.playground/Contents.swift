import UIKit

class Person {
    var name: String?
    var height: Float?
    var weight: Float?
    init(name: String, height: Float, weight: Float){
        self.name = name
        self.height = height
        self.weight = weight
    }
    var bmi: Float {
        get {
            return weight! / (height! * 2)
        }
 
        set(bmi) {
            if bmi < 20 {
                height = 1.7
                weight = 50
            } else if bmi >= 20 {
                height = 1.65
                weight = 64
            }
        }
    }
    var bmi2: Float = 0.0 {
        willSet(bmi2){
            print("bmi willSet 호출됨 -> \(bmi2)")
        }
        didSet {
            print("bmi didSet 호출됨 -> \(bmi2), \(oldValue)")
        }
    }
}
let test = Person(name: "pino", height: 1.785, weight: 82.5)
print("BMI 값 --> \(test.bmi2)")

let num = Int("123")
type(of: num)


class PropertyObserver {
    var height = 0.0
    
    var width = 0.0 {
        // willSet :
        willSet {
            print("willSet :", width, "->", newValue)
        }
        
        // -------willSet과 didSet 바뀌는 시점------
        
        // didSet :
        didSet {
            height = width / 2
            print("didSet :", oldValue, "->", width)
        }
    }
}

var obs = PropertyObserver()
obs.height
obs.width
obs.height = 456
obs.height
obs.width
obs.width = 123
obs.width
obs.height

struct Job {
    var income: Int = 0 {
        willSet(newIncome) {
            print("\(newIncome)")
            print("이번 달 월급은 \(newIncome)원입니다.")
        }
        // 둘중 하나만 사용할 경우가 많다.
        // willSet 뒤에(newValue)생략
        // didSet 뒤에 (oldValue)생략
        
        didSet(a) {
            if income > a {
                print("\(a)")
                print("월급이 \(income - a)원 증가하셨네요. 소득세가 상향조정될 예정입니다.")
            } else {
                print("저런, 월급이 삭감되었군요. 그래도 소득세는 깍아드리지 않아요. 알죠?")
            }
        }
    }
}

// willet 초기값
// didSet 값을 입력한 후 최종 결과값
var job = Job(income: 1000000)
job.income = 2000000
