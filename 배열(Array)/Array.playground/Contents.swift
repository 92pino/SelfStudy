import UIKit

// 배열
// 일련의 순서를 가지는 리스트 형식의 값을 저장하는 데에 사용되는 자료형
// 개별 아이템들의 각각의 순서를 index라고 한다.

// 정적인 배열 방식

var cities = ["Seoul", "New York", "LA", "Santiago"]
// 정적인 배열 선언 시 저장하는 아이템 타입은 모두 같아야 한다.
// String으로 통일

// 배열의 아이템을 참조하는 법
cities[0]   // Seoul
cities[1]   // New York

// 배열 순회 탐색
// 1. 배열의 길이를 직접 다루는 방식
for i in 0..<cities.count { // cities.count를 length 변수에 담아서 할당 가능
    print("\(i)번째 배열 원소는 \(cities[i])입니다.")
}

//var length = cities.count
//for i in 0..<length {
//    print("\(i)번째 배열 원소는 \(cities[i])입니다.")
//}

//배열의 순회 특성 (이터레이터) 사용

for row in cities {
    print("배열 원소는 \(row)입니다.")
}

// 이터레이터를 사용하게되면 몇번째 인덱스인지 알기 어려우므로 index(of:)를 사용하면 인덱스 값을 역으로 찾을수 있다.

for row2 in cities {
    let idx = cities.index(of: row2)
    
    print("\(idx!)번쨰 배열 원소는\(row2)입니다.")
}

// 동적인 배열 방식
// 배열 선언, 초기화 방식
// 1
//var city = [String] // 선언
//city = [String]()   // 초기화

// 2
//var country : [String]  // 선언
//country = []            // 초기화

// 3
//var list : [Int] = []   // 타입 어노테이션 + 초기화

// 4
//var rows : Array<Float> = [Float]() // 타입 어노테이션 + 제네릭 + 초기화

// 5
//var tables : [String] = Array()     // 타입 어노테이션 + 구방식의 초기화

var list = [String]()

if list.isEmpty {
    print("배열이 비어 있는 상태입니다.")
} else {
    print("\(list)")
}

var cities2 = [String]()

// 값이 비어있는 상태에서 cities2[0] = "Seoul"을 추가할 경우 0번째 index에 값이 없으므로 오류 발생
// insert 메소드도 동일
// index값이 있는 경우에만 추가 가능(0번째 index는 가능)

cities2.insert("test", at:0)

cities2.append("Seoul")
cities2.append("New York")
cities2.insert("Tokyo", at: 1)
cities2.append(contentsOf: ["Dubai", "Sydney"])
print(cities2)

// default로 배열의 개수를 미리 정의
// repeating에는 배열의 아이템에 미리 들어가 있을 아이템을 넣어놓는다
var test = "test"
var cities3 = Array(repeating: test, count: 3)
var cities4 = [String](repeating: test, count: 3)

// 범위 연산자를 이용

var alphabet = ["a", "b", "c", "d", "e"]

alphabet[0...2]
alphabet[2...3]
alphabet[1..<3]
//alphabet[0...5]

alphabet[1...2] = ["1", "2", "3"]
alphabet[2...4] = ["A"]
alphabet

// 집합
// 집합 정의
var genres : Set<String> = []
genres.insert("classic")
genres.insert("rock")
genres.insert("balad")

if genres.isEmpty {
    print("집합이 비어있습니다.")
} else {
    print("\(genres.count) 개의 아이템이 저장되어 있습니다.")
}

for g in genres {
    print("\(g)")
}

for g in genres.sorted() {
    print("\(g)")
}

genres.insert("Jazz")
genres.remove("test")
genres.removeAll()
genres

if genres.contains("rock") {
    print("rock 아이템이 저장되어 있습니다.")
} else {
    print("rock이 저장되어있지 않습니다.")
}

