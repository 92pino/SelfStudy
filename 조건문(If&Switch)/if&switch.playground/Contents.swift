import UIKit

// if
// if 조건절을 사용하여 조건식의 평가 결과가 true일 경우에만 코드 블록 내부의 구문을 실행

//if <조건식> {
//    <실행할 구문>
//} else if <조건식2> {
//    <실행할 구문>
//} else {
//    <실행할 구문>
//}

var adult = 19
var age = 15

if age < adult {    // 15 < 19 조건식 값은 true이므로 구문 실행
    print("당신은 미성년자")
}

var age2 = 21

if age2 < adult {
    print("당신은 미성년자")
} else {    // age2 < adult 조건식 값이 false이므로 else 구문 실행
    print("당신은 성인!")
}

// if 구문 중첩
var gender = "M"

if adult > age2 {
    if gender == "M" {
        print("남자 미성년자")
    } else {
        print("여자 미성년자")
    }
} else {
    if gender == "M" {  // adult > age2 조건식 값이 false이고 gender 의 값이 "M"과 일치하므로 gender == "M" 구문 실행
        print("남자 성인")
    } else {
        print("여자 성인")
    }
}

// if ~ else if

if gender == "M" {
    print("남자 성인입니다.")
} else if gender == "W" {
    print("여자 성인입니다.")
} else {
    print("사람이 아닙니다.")
}

// if ~ else if ~ else 를 이용한 웹 브라우저 정보 받아오기

//var browser = "Safari"  // 입력받을 브라우저명
//var browserName : String    // 브라우저 이름을 저장할 변수
//
//if browser == "IE" {
//    browserName = "인터넷 익스플로러"
//} else if browser == "FF" {
//    browserName = "파이어폭스"
//} else if browser == "Chrome" {
//    browserName = "크롬"
//} else if browser == "Opera" {
//    browserName = "오페라"
//} else if browser == "Safari" {
//    browserName = "사파리"
//} else {
//    browserName = "알수없는 브라우저"
//}
//
//print("당신이 사용하고 있는 브라우저는 \(browserName)입니다.")

// guard
// 후속 코드들이 실행되기 전에 특정 조건을 만족하는지 확인하는 용도
// 특정 조건을 만족하지 않은 채로 후속 코드를 실행하면 심각한 오류가 발생할 경우 전체 구문을 조기종료하기 위한 목적

func divide(base: Int) {
    // 숫자를 0으로 나눌 경우 오류 발생 방지
    guard base != 0 && base > 0 && base < 100 else {
        print("오류입니다.")
        return
    }
    
    let result = 100 / base
    print(result)
}
divide(base: 101)

// switch
// 패턴으로 비교하고 실행 블록을 결정하는 조건문
// 다른 언어 switch문과 달리 참인 비교패턴이 나올 경우 전체 switch문 종료

//switch <비교대상> {
//    case <비교패턴1> :
//        <비교 패턴1이 일치했을 때 실행할 구문>
//    case <비교패턴2> :
//        <비교 패턴1이 일치했을 때 실행할 구문>
//    default :
//        <어느 비교 패턴과도 일치하지 않았을 때 실행할 구문
//}

let val = 2

switch val {
case 1 :
    print("일치한 값은 1입니다.")
case 2 :
    print("일치한 값은 2입니다.")
case 2 :
    print("일치한 값 2가 더 있습니다.")
default :
    print("일치한 값이 없습니다.")
}

// case 2 가 2개 있는데 첫번째 비교패턴 case2 에서 true로 실행되면 다음 case 2 가 참이여도 실행이 종료된다.

let sampleChar : Character = "a"

switch sampleChar {
case "a" :
    fallthrough
case "A" :
    fallthrough
case "B" :
    print("test")
default :
    print("B")
}

// fallthrough 구
// fallthrough구문이 있는 case 블록은 참일 경우 인접한 case블록으로 실행
// case a, case A 에 fallthrough가 있으므로 그 다음 인접한 case블록 case "B" 실행 후 종료

var value = 3

switch value {
case 0,1 :
    print("0 또는 1입니다.")
case 2,3 :
    print("2 또는 3입니다.")
default :
    print("일치하는 값이 없습니다.")
}

var value2 = (2,3)

switch value2 {
case let (3,y) :
    print("튜플의 첫 번째 값이 3일 때 두 번째 값은 \(y)입니다.")
case let (x,y) :
    print("\(x),\(y)")
}

var passtime = 1957

switch passtime {
case 0..<60 :
    print("방금 작성된 글입니다.")
case 60..<3600 :
    print("조금 전 작성된 글입니다.")
case 3600..<86400 :
    print("얼마 전 작성된 글입니다.")
default :
    print("예전에 작성된 글입니다.")
}

// where 구문 추가
// where절은 무엇인가???

var point = (3, -3)

switch point {
case let (x,y) where x == y :
    print("\(x)과 \(y)은 x==y 선 상에 있습니다.")
case let (x,y) where x == -y :
    print("\(x)과 \(y)은 x==-y 선 상에 있습니다.")
default :
    print("test")
}

// continue 를 이용한 문자열의 특정 문자 변경

var text = "This is a swift book for Apple's programming language"
var result = ""

for char in text.characters {
    if char == " " {
        result.append(Character("_"))
        continue
    } else if char == "o" {
        result.append(Character("O"))
        continue
    } else if char == "'" {
        break
    }
    
    result.append(char)
}
print(result)

for i in 1...5 {
    if i == 3 {
        break
    }
    for j in 1...9 {
        
        if j == 3 {
            break
        }
        print("\(i) X \(j) = \(i * j)")
    }
}

// 실행 여부를 결정할 플래그
var loopFlag = true

for k in 1...5 {
    for l in 1...9 {
        if l == 3 {
            loopFlag = false
            break
        }
        
        print("\(k) X \(l) = \(k * l)")
    }
    
    if loopFlag == false {
        break
    }
}

// 레이블을 활용한 break

outer : for i in 1...5 {
    inner : for j in 1...9 {
        if j == 3 {
            break outer
        }
        
        print("\(i) X \(j) = \(i * j)")
    }
}
