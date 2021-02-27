//
//  ViewController.swift
//  MylittleMonster
//
//  Created by Jesper Bertelsen on 24/02/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var MonsterImg: MonsterImg!
    @IBOutlet weak var HeartImg: DragImg!
    @IBOutlet weak var FoodImg: DragImg!
    @IBOutlet weak var Penalty1: UIImageView!
    @IBOutlet weak var Penalty2: UIImageView!
    @IBOutlet weak var Penalty3: UIImageView!
    
    //              variables
    let OPAQUE: CGFloat = 1.0
    let DIM_ALPHA: CGFloat = 0.2
    
    var currentPenalty: Int = 0
    var timer: Timer!
    var monsterHappy = false
    var currentItem: UInt32!
    //       Audioplayer
    var musicPlayer: AVAudioPlayer!
    var sfxBite:AVAudioPlayer!
    var sfxDeath:AVAudioPlayer!
    var sfxHeart:AVAudioPlayer!
    var sfxSkull:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Penalty1.alpha = DIM_ALPHA
        Penalty2.alpha = DIM_ALPHA
        Penalty3.alpha = DIM_ALPHA
        
        FoodImg.dropTarget = MonsterImg
        HeartImg.dropTarget = MonsterImg
        
        NotificationCenter.default.addObserver(self, selector: #selector(itemDroppedOnTarget), name: Notification.Name(rawValue: "onTargetDropped"), object: nil)
        
        do {
            try musicPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "cave-music", ofType: "mp3")!) as URL)
            try sfxBite     = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "bite", ofType: "wav")!) as URL)
            try sfxDeath    = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "death", ofType: "wav")!) as URL)
            try sfxHeart    = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "heart", ofType: "wav")!) as URL)
            try sfxSkull    = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "skull", ofType: "wav")!) as URL)
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        startGame()
        
    }
    
    func startTimer() {
        
        if timer != nil {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 5.0,
                                     target: self,
                                     selector: #selector(updateGame),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateGame() {
        if !monsterHappy {
            currentPenalty += 1
            sfxSkull.play()
            if currentPenalty == 1 {
                Penalty1.alpha = OPAQUE
                Penalty2.alpha = DIM_ALPHA
            } else if currentPenalty == 2 {
                Penalty2.alpha = OPAQUE
                Penalty3.alpha = DIM_ALPHA
            } else if currentPenalty >= 3 {
                Penalty3.alpha = OPAQUE
                gameOver()
            } else if currentPenalty == 0 {
                Penalty1.alpha = DIM_ALPHA
                Penalty2.alpha = DIM_ALPHA
                Penalty3.alpha = DIM_ALPHA
            }
        }
        let rand = arc4random_uniform(2)
        if rand == 0 {
            heartIsOpaque()
            foodIsDim()
            currentItem = rand
            
            
        } else if rand == 1 {
            foodIsOpaque()
            heartIsDim()
            currentItem = rand
            
            
        }
        monsterHappy = false
        
    }
     @objc func itemDroppedOnTarget(){
        monsterHappy = true
        heartIsDim()
        foodIsDim()
        if currentItem == 0 {
            sfxHeart.play()
        } else {
            sfxBite.play()
        }
        
        
    }
    
    func startGame() {
        let rand = arc4random_uniform(2)
        if rand == 0 {
            heartIsDim()
        } else if rand == 1 {
            foodIsDim()
        }
        startTimer()
    }
    
    func gameOver(){
        timer.invalidate()
        MonsterImg._stopAnimating()
        Timer.scheduledTimer(timeInterval: 0.5, target: MonsterImg as Any, selector: #selector(MonsterImg.playDeathAnimation), userInfo: nil, repeats: false)
        print("gameOver")
        sfxDeath.play()
        
    }
    func heartIsDim() {
        HeartImg.alpha = DIM_ALPHA
        HeartImg.isUserInteractionEnabled = false
    }
    func heartIsOpaque() {
        HeartImg.alpha = OPAQUE
        HeartImg.isUserInteractionEnabled = true
    }
    func foodIsDim() {
        FoodImg.alpha = DIM_ALPHA
        FoodImg.isUserInteractionEnabled = false
    }
    
    func foodIsOpaque() {
        FoodImg.alpha = OPAQUE
        FoodImg.isUserInteractionEnabled = true
    }

}

