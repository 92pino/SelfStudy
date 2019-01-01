import UIKit

// 반복문 형식

// for문
// 횟수에 의한 반복

//for <루프 상수> in <순회 대상> {
//    <실행할 구문>
//}

for row in 1...5 {
    print(row)
}

//1
//2
//3
//4
//5

// 구구단 2단 만들기
for timesTable in 1...9 {
    print("2 X \(timesTable) = \(timesTable * 2)")
}

// 구구단 응용

var startNum: Int = 1
var loop:Int = 9
var endNum: Int = 9

for row in startNum+1...endNum { // 2단부터 시작하기 위해 startNum + 1
    for loop in startNum...endNum {
        print("\(row) X \(loop) = \(row * loop)")
    }
}

// 문자열의 문자 순회
var lang = "Swift"
for char in lang.characters {
    print("개별 문자는 \(char)입니다.")
}

// 루프상수 생략
// 단순히 순회 대상의 크기만큼 반복하는것이 중요할 때?
// 루프 상수가 굳이 필요가 없다

let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1...size {
    print(keyword)
    keyword = padChar + keyword
    print(keyword)
}
// for문이 돌 때 마다 0(padChar)이 keyword에 추가되는 형식으로
// default "3" 앞에 padChar이 size 횟수만큼 추가됨
print("\(keyword)") // 000005

// 다중루프
// for ~ in 구문 중첩
// 구구단 응용과 동일

var startNum2: Int = 1
var loop2:Int = 9
var endNum2: Int = 9

for row2 in startNum2+1...endNum2 { // 2단부터 시작하기 위해 startNum2 + 1
    for loop2 in startNum2...endNum2 {
        print("\(row2) X \(loop2) = \(row2 * loop2)")
    }
}

// while구문
// 조건에 의한 반복
// 조건이 true일 경우 계속 실행

// while을 사용할 경우
//실행 횟수가 명확하지 않을 때

//while <조건식> {
//    <실행할 구문>
//}

var n = 2
while n < 1000 {
    n = n * 2
}
print(n)

// default 2로 while반복문을 돌리다가 n *2가 1000을 넘어갈 때 n 출력
// n < 1000 가 true면 while 구문 실행 false가 될 때 while 구문을 끝내고 print(n)으로 이동
// 결과값 1024

// repeat ~ while
//repeat {
//    <실행할 구문>
//}
//while <조건식>

// 조건 식이 false여도  while 구문을 사용해야 하는 조건 중에서 반드시 한 번은 실행된다.

var m = 1024
repeat {
    m = m * 2
}
while m < 1000

print("m = \(m)")
