import UIKit

let num = Int("123")
Int("Swift")

// 옵셔널 타입 선언
//var optInt = Int?
//
//var optStr = String?
//
//var optDouble = Double?

//var optInt: Int?
//optInt = 3

var optStr: String?
optStr = "Swift"

var optArr: [String]?
optArr = [ "c" , "JAVA", "Objective-C", "SmallTalk"]

var optDic: [String : Int]?
optDic = ["국어" : 94, "수학" : 88, "영어" : 96]

var optInt: Int? = 3

print("옵셔널 자체의 값은 \(optInt)")
print("!로 강제 해제한 값 : \(optInt!)")

Int("123")! + Int("123")!
Int("123")! + 30

var str = "123"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!)입니다.")
} else {
    print("값 변환에 실패하였습니다.")
}

var test = Int("123")
print(test)

var str2 = "Swift"
var intFromStr2 = Int(str2) // Int(str2)는 숫자로 변환할수 없으므로 nil 반환

print(intFromStr2)

if let intFromStr2 = Int(str2) {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr2)입니다.")
} else {
    print("값 변환에 실패하였습니다.")
}

func intStr(str2: String) {
    
    guard let intFromStr2 = Int(str2) else {
        print("값 변환에 실패하였습니다.")
        
        return
    }
    
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr2)입니다")
}

var capital = ["KR" : "Seoul", "EN" : "London", "FR" : "Paris"]

//print(capital["KR"]!)

if capital["KR"] != nil {
    print(capital["KR"]!)
}

if let val = capital["KR"] {
    print(val)
}
