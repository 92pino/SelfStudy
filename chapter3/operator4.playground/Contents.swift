import UIKit

func compare(value: Int) -> Int {
    if value < 0 {
        return -1
    } else if value == 0 {
        return 0
    } else {
        return 1
    }
}

var result = compare(value: -3)
result

func compare2(value: Int) -> Int {
    if !(value < 0 || value == 0) {
        return -1
    } else {
        return 1
    }
}
result = compare2(value: 10)

let value: Int = 12

if value <= 10 {
    print("숫자 값이 10보다 작습니다.")
} else {
    print("숫자 값이 10보다 큽니다.")
}

let limitAge = 19
func isMinor(_ age: Int) -> Bool {
    if age < 19 {
        return true
    } else {
        return false
    }
}
isMinor(limitAge)
