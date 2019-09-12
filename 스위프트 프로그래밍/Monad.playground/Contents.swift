import UIKit

// 모나드란?
// - 특정한 상태로 값을 포장하는 것, Optional과 같이 값이 있을 수도 있고, 없을 수도 있는 상태와 같이 값을 포장하는 것
// - 함수객체와 모나드는 특정 기능이 아닌 디자인 패턴 혹은 자료구조
func addThree(_ num: Int) -> Int {
    return num + 3
}

addThree(3)

// flatMap
// 값이 있을 경우 포장을 풀어서 값을 처리한 후 포장된 값을 반환
// 값이 없을 경우 없는 대로 다시 포장하여 반환

// 배열을 벗기거나 nil값을 제외 할 수 있음
func doubledEven(_ num: Int) -> Int? {
    if num % 2 == 0 {
        return num * 2
    }
    return nil
}

Optional(4).flatMap(doubledEven)
print(nil == Optional.none)

print(Optional.none.flatMap(doubledEven))


let optionalArr: [Int?] = [1, 2, nil, 5]

let mappedArr: [Int?] = optionalArr.map { $0 }
let flatmappedArr: [Int] = optionalArr.flatMap { $0 }

print(mappedArr)
print(flatmappedArr)

func stringToInt(str: String) -> Int? {
    return Int(str)
}

func intToString(integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

var result: Any = optionalString.flatMap(stringToInt).flatMap(intToString).flatMap(stringToInt)
print(result)
result = optionalString.map(stringToInt)
print(result)

// flatMap과 동일한 기능을 구현하기 위해서 해야할 옵셔널 바인딩
if let str: String = optionalString {
    if let num: Int = stringToInt(str: str) {
        if let finalStr: String = intToString(integer: num) {
            if let finalNum: Int = stringToInt(str: finalStr) {
                result = Optional(finalNum)
            }
        }
    }
}

print(result)

// 바인딩을 통해서 연산을 실행하는 것 보다 flatMap을 사용하는게 더 간단
