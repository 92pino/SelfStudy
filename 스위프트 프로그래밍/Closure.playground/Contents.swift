import UIKit

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

// 기본 정렬 함수
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed: [String] = names.sorted(by: backwards)
print(reversed)

// 기본적인 클로저 형식
/*
 { (매개변수들) -> 반환 타입 in
    실행 코드
 }
*/

// 클로저 축약 과정

let reversed1: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}

let reversed2: [String] = names.sorted {
    return $0 > $1
}

let reversed3: [String] = names.sorted { $0 > $1 }

let reversed4: [String] = names.sorted (by : >)

print(reversed2)

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

// 탈출 클로저는 너무 이해가안됨...
// 추후에 다시 공부해보기로
