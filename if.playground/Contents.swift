import UIKit

print("============= 20190311 =============")
func getIntro(name: String, age: Int) {
    print("안녕하세요 \(age)살의 \(name)입니다.")
}
getIntro(name: "Pino", age: 28)

func getNum(_ num: Int) {
    if num % 2 == 0 {
        print("2의 배수입니다.")
    } else {
        print("2의 배수가 아닙니다.")
    }
}
getNum(11)

func times(_ num: Int, defaultNum: Int = 10) -> Int {
    return num * defaultNum
}
print(times(10))

func average(test1: Double, test2: Double, test3: Double, test4: Double) -> Double {
    return (test1 + test2 + test3 + test4) / 4
}
average(test1: 10.2, test2: 50, test3: 80.3, test4: 100)

func grade(_ num: Int) -> String {
    switch num {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    default:
        return "F"
    }
}

grade(70)

func getGrade(_ num: Int...) -> String {
    var total = 0
    
    for sum in num {
        total += sum
    }
    
    let avg = total / num.count
    
    switch avg {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    default:
        return "F"
    }
}
getGrade(80, 80, 80, 80, 80)

print("============= 20190312 =============")

func returnNum(_ num01: Int, _ num02: Int) -> Int {
    var total = 0
    
    total = Int(String(num01) + String(num02))!
    
    return total
}
returnNum(15, 5)

func returnNum02(_ num01: Int, _ num02: Int) -> Int {
    var total = num01, sec = num02
    
    while sec > 0 {
        sec /= 10
        total *= 10
    }
    
    return total + num02
}
print(returnNum02(10, 30))

func getString(_ str01: String, _ str02: String) -> Bool {
    if str01 == str02 {
        return true
    } else {
        return false
    }
}
print(getString("10", "10"))

func q03(_ num: Int) -> Int {
    for i in 1...num {
        if num % i == 0 {
            print(i)
        } else {
            continue
        }
    }
    
    return num
}
q03(10)

func q04(_ num: Int) -> Bool {
    var chk: Bool = true
    
    for number in 2...(num - 1) {
        if num % number == 0 {
            chk = false
        }
    }
    return chk
}
q04(17)

var arr = ["a", "b", "c", "a", "e", "d", "c"]

func q05(_ arr: [String]) -> [String]{
//    var arr = arr
    var result: [String] = []
    
    for i in 0...arr.count - 1 {
        var cnt = true
        for j in 0...arr.count - 1 {
            if i == j {
                continue
            }
            if arr[i] == arr[j] {
                cnt = false
            }
        }
        
        if cnt {
            result.append(arr[i])
        }
    }
    return result
}

print(q05(arr))

var arr2 = [2,9,1,5,12,6,3,7]
func q06(_ arr: [Int]) -> [Int] {
    var newArr: [Int] = []
    for i in arr {
        if i % 2 == 0 {
            newArr.append(i)
        } else {
            newArr.insert(i, at: 0)
        }
    }
    return newArr
}
print(q06(arr2))
