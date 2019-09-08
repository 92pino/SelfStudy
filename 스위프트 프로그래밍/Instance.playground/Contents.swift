import UIKit

// 기본적인 형태의 init
class SomeClass {
    init() {
        
    }
}

struct SomeStruct {
    init() {
        
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 함.
        self = .someCase
    }
}

struct Area {
    var squareMeter: Double
    
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}

let roomOne: Area = Area(fromPy: 15.0)
roomOne.squareMeter

let roomTwo: Area = Area(fromSquareMeter: 33.06)
roomTwo.squareMeter

let roomThree: Area = Area(value: 30.0)
roomThree.squareMeter

let roomFour: Area = Area(55.0)
roomFour.squareMeter

// Area()  ==> 에러발생

class Person {
    var name: String?
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let pino: Person = Person(name: "pino")
print(pino.name)


class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile() {
        print("Open File : \(fileName)")
    }
    
    func modifyFIle() {
        print("Modify File : \(fileName)")
    }
    
    func writeFile() {
        print("Write File : \(fileName)")
    }
    
    func closeFile() {
        print("Close File : \(fileName)")
    }
    
    deinit {
        print("Deinit instance")
        writeFile()
        closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFIle()
}

fileManager = nil
