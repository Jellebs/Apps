//
//  MonsterImg.swift
//  MylittleMonster
//
//  Created by Jesper Bertelsen on 25/02/2021.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation() {
        self.image = UIImage(named: "idle1.png")
        _stopAnimating()
        var imageArray = [UIImage]()
        for x in stride(from:1, through:4, by:+1) {
            let img = UIImage(named:"idle\(x).png")
            imageArray.append(img!)
            }
        
        self.animationImages = imageArray
        //self uiimageview(monsterimg) animeres med billeder fra ImageArray
        self.animationDuration = 1.2
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    @objc func playDeathAnimation() {
        self.image = UIImage(named: "dead5.png")
        var imageArray = [UIImage]()
        for x in stride(from:1, through:5, by:+1) {
            let img = UIImage(named:"dead\(x).png")
            imageArray.append(img!)
            }
        
        self.animationImages = imageArray
        //self uiimageview(monsterimg) animeres med billeder fra ImageArray
        self.animationDuration = 1.2
        self.animationRepeatCount = 1
        self.startAnimating()
        print("DeathAnimation")
    }
    func _stopAnimating() {
        if isAnimating {
            stopAnimating()
        }
    }
}


    
    
