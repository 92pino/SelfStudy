import UIKit

let value1 = (10, "안녕!", Float(2.4), true)
print("value1 튜플의 값 -> \(value1)")
value1.0
value1.1
value1.2
value1.3

var item1 = value1.0
item1

let value2 = (x:10, y:20)
var item2 = value2.x
print("value2 튜플의 x 원소 -> \(item2)")

var value3: (Int, Int) = (10, 20)
value3.0
print("value3 튜플의 첫 번째 원소 -> \(value3.0)")

let value4: (Int, Int) = (10, 10)
let (x,y) = value4
print("튜플 안의 x값 -> \(x)")

func getLocation() -> (x: Int, y: Int) {
    return (10, 10)
}
var location = getLocation()
print("내 위치 -> \(location.x), \(location.y)")

func getLocation2() -> (Int, Int) {
    return(20, 20)
}
location = getLocation2()
print("내 위치 -> \(location.x), \(location.y)")

func getPerson(value1: String) -> (name: String, age: Int?)? {
    var value2: Int?
     value2 = Int(value1)
    if value2 == nil {
        print("전달 받은 값은 숫자가 아닙니다.")
        return nil
    } else {
        print("전달 받은 숫자 -> \(value2!)")
        return (name: "Pino", age: value2)
    }
}
var result = getPerson(value1: "20")
print("getPerson 함수 호출 결과 -> \(result)")
result = getPerson(value1: "안녕")
print("getPerson 함수 호출 결과 -> \(result)")


func getCount(persons:(name: String, age: Int)...) -> Int {
    var cnt = 0
    for (_, _) in persons {
        cnt += 1
    }
    return cnt
}
var result2 = getCount(persons: ("김진수", 20), ("김진희", 22))
print("getCount 함수 호출 결과 -> \(result2)")

func getCount2(persons:(name: String?, mobile: String?)...) -> (Int, Int) {
    var nameCount = 0
    var mobileCount = 0
    
    for (value1, value2) in persons {
        if value1 != nil {
            nameCount += 1
        }
        
        if value2 != nil {
            mobileCount += 1
        }
    }
    return (nameCount, mobileCount)
}
print(getCount2(persons: ("Pino", "010"), ("Pino", nil)))

func calcAge(name: String, mobile: String, birth: Int?) -> (String, String, Int)?{
    if birth == nil {
        return nil
    }
    var currentYear = 2019
    let age = currentYear - birth!
    
    return (name, mobile, age)
}
let person = calcAge(name: "pino", mobile: "010-2191-8382", birth: 1992)
person!.2
