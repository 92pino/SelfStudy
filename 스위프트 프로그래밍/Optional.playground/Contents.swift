import UIKit

/*:
 ---
 ## Optional이란?
 - 값이 있을수도 있고, 없을수도 있음을 나타내는 표현
 - 변수 또는 상수 값이 'nil'일 수도 있다.
 */

//var myName: String = "pino"
//myName = nil    // 오류 발생

var myName: String? = "pino"
print(myName)

myName = nil

print(myName)

// 원시값을 통한 열거형 초기화
let primary = School(rawValue: "유치원")
