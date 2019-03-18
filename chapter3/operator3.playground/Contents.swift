import UIKit

func sum(start: Int, end: Int) -> Int {
    var total = 0
    for i in start ..< end {
        total += i
    }
    
    return total
}
var result = sum(start: 1, end: 11)
print("\(result)")

let start: Int = 200
let end: Int = 500

var total = 0

for i in start...end {
    total += i
}

print(total)


