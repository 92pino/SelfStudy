import UIKit

// Tuple

let x: (String, Int, Double) = ("Hello", 5, 0.85)
let (word, number, value) = x
print(word)

let y: (w: String, i: Int, v: Double) = ("hello", 5, 0.85)

print(y.w)
print(y.i)
print(y.v)
