import UIKit

// map
// 자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수
// 보통 기존 데이터를 변형하는데 사용

let numbers: [Int] = [0, 1, 2, 3, 4]

var doubledNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubledNumbers.append(number * 2)
    strings.append("\(number)")
}
print(doubledNumbers)
print(strings)



//doubledNumbers = numbers.map({ (number: Int) -> Int in
//    return number * 2
//})

//strings = numbers.map({ (number: Int) -> String in
//    return "\(number)"
//})

doubledNumbers = numbers.map({ return $0 * 2 })
strings = numbers.map ({ return "\($0)" })

print(doubledNumbers)
print(strings)

let evenNum: [Int] = [0, 2, 4, 6, 8, 10]
let oddNum: [Int] = [1, 3, 5, 7, 9]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNum = evenNum.map(multiplyTwo)
print(doubledEvenNum)

let doubledOddNum = oddNum.map(multiplyTwo)
print(doubledOddNum)

// filter
// 컨테이너 내부의 값을 걸러서 추출하는 역할

let filterNum: [Int] = [0, 1, 2, 3, 4, 5]

let filterEvenNum: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(filterEvenNum)

let filterOddNum: [Int] = numbers.filter{ $0 % 2 != 0 }
print(filterOddNum)

let mapFilterNum: [Int] = [0, 1, 2, 3, 4, 5]

let mappedNum: [Int] = numbers.map { $0 + 3 }

let mapFilterEvenNum: [Int] = mappedNum.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(mapFilterEvenNum)

let mapFilterOddNum: [Int] = numbers.map { $0 + 3 }.filter { $0 % 2 != 0 }
print(mapFilterOddNum)

// reduce
// 컨테이너 내부의 콘텐츠를 하나로 합하는 기능
// 배열일 경우 모든 값을 합산

let reduceNum: [Int] = [1, 2, 3]
var sum: Int = reduceNum.reduce(0) { (result: Int, element: Int) -> Int in
    print("\(result) + \(element)")
    
    return result + element
}
print(sum)

let subtractFromThree: Int = reduceNum.reduce(3) {
    print("\($0) - \($1)")
    
    return $0 - $1
}
print(subtractFromThree)

let names: [String] = ["f1", "f2", "f3", "f4"]

let reduceName: String = names.reduce("yagom's friend : ") {
    return $0 + ", " + $1
}
print(reduceName)

enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "f1", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "f2", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "f3", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "f4", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "f5", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "f6", gender: .unknown, location: "대전", age: 29))

var result: [Friend] = friends.map { Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }

result = result.filter { $0.location != "서울" && $0.age >= 25 }

let string: String = result.reduce("서울 외의 지역에 거주하며 25세 이상인 친구") { $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세 "}
print(string)
