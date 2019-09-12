import UIKit

// 서브스크립트
// 별도의 설정자나 접근자 등의 메서드를 구현하지 않아도 인덱스를 통해 값을 설정하거나 가져올수 있다.
// ex)
// Array == someArray[index]
// Dictionary = someDictionary[key]
// 한 타입에 여러 개의 스크립트를 정의할 수 있으며 다른 타입을 인덱스로 갖는 여러 개의 서브스크립트를 중복 정의 (override)할 수도 있다.

/*
 기본 문법
 
 subscript(index: Int) -> Int {
     get {
        // 적절한 서브스크립트 결과값 변환
     }
 
     set(newValue) {
        // 적절한 설정자 역할 수행
     }
 }
 
 // 읽기 전용 정의 문법
 subscript(index: Int) -> Int {
     get {
        // 적절한 서브스크립트 값 변환
     }
 }
 
 subscript(index: Int) -> Int {
    // 적절한 서브스크립트 결과값 변환
 }
*/

struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MiJeong", "Juhyun", "JiYoung", "SeongUk", "MoonDuk")
print(highSchool)

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")

struct Student2 {
    var name: String
    var number: Int
}

class School2 {
    var number: Int = 0
    var students: [Student2] = [Student2]()
    
    func addStudent(name: String) {
        let student: Student2 = Student2(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int) -> Student2? {
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        
        set {
            guard var newStudent: Student2 = newValue else {
                return
            }
            
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String) -> Int? {
        get {
            return self.students.filter { $0.name == name }.first?.number
        }
        
        set {
            guard var number: Int = newValue else {
                return
            }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student2 = Student2(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    
    subscript(name: String, number: Int) -> Student2? {
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highSchool2: School2 = School2()
highSchool2.addStudents(names: "MiJeong", "Juhyun", "JiYoung", "SeongUk", "MoonDuk")

let aStudent2: Student2? = highSchool2[1]

print("\(aStudent2?.number) \(aStudent2?.name)")
