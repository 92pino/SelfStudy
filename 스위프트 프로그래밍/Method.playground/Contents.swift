import UIKit

class LevelClass {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    func levelUp() {
        print("Level up!")
        level += 1
    }
    
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    func reset() {
        print("Reset")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.level
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.jumpLevel(to: 10)
levelClassInstance.jumpLevel(to: 0)
levelClassInstance.levelDown()

struct LevelStruct {
    var level: Int = 0
    
    // 구조체, 열거형의 경우 값 타입이므로 메서드 앞에 mutating 키워드를 붙여 인스턴스 내부의 값을 변경한다는 것을 명시
    /// 여기서는 level이라는 저장 프로퍼티의 값을 변경
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("reset")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.reset()
levelStructInstance.level

class LevelClassSelf {
    var level: Int = 0
    
    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// navigation Example

// 시스템 음향은 한 기기에서 유일한 값이어야함
struct SystemVolume {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 된다.
    static var volume: Int = 5
    
    static func mute() {
        // 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용
        
        // SystemVolume.volume = 0과 동일한 표현
        // self.volume = 0
        SystemVolume.volume = 0
    }
}

class Navigation {
    var volume: Int = 5
    
    func guideWay() {
        SystemVolume.mute()
    }
    
    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

print(SystemVolume.volume)

let myNavi: Navigation = Navigation()
myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)
