//
//  MusicPlayerManager.swift
//  MyMusicPlayer
//
//  Created by JinBae Jeong on 2019/10/23.
//  Copyright © 2019 yagom. All rights reserved.
//

import Foundation
import AVFoundation

/*
 
 MVVM을 쓰는 이유
 
 1. Model(데이터) - View(화면) - Controller (처리 로직)
 Massive View Controller 뷰 컨트롤러가 너무 비대해진다
 이것을 방지하기 위해 MVVM 디자인 패턴이 만들어짐
 
 뷰 컨트롤러 안에 모든 코드가 들어가지면
 
 2. Testability
 
*/

class MusicPlayerManager: NSObject {
    
    static let shared = MusicPlayerManager()
    
    lazy var player: AVAudioPlayer = AVAudioPlayer()
    
    weak var delegate: MusicPlayerManagerDelegate?
    
    private override init() {
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "sound") else {
            print("음원 파일 에셋을 가져올 수 없습니다.")
            return
        }
        
        do {
            self.player = try AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("플레이어 초기화 실패")
            print("코드: \(error.code), 메세지 : \(error.localizedDescription)")
        }
    }
    
    func play() {
        player.play()
    }
}

extension MusicPlayerManager: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        delegate?.didFinishPlaying()
    }
}

protocol MusicPlayerManagerDelegate: class {
    func didFinishPlaying()
}
