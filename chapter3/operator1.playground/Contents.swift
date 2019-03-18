import UIKit

let userId = "test1"
let userPassword = "123456"

func login(id: String, password: String) -> Bool {
    if (id == userId) && (password == userPassword) {
        return true
    }
   
    return false
}

var inputId = "test1"
var inputPassword = "123456"
var result = login(id: inputId, password: inputPassword)
print("아이디 확인 결과 -> \(result)")

let a = 10
let b = 20
let c = 304
if (a + b) == c {
    print("값이 같습니다.")
} else {
    print("값이 다릅니다.")
}

let name: String? = "pino"
let age: Int? = nil
if name == nil || age == nil {
    print("nil이 있습니다.")
} else {
    print("nil이 없습니다.")
}


