//
//  DragImg.swift
//  MylittleMonster
//
//  Created by Jesper Bertelsen on 25/02/2021.
//

import Foundation
import UIKit

class DragImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    var dropTarget: UIView?
    var originalPosition: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        originalPosition = self.center

        }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self.superview)
            self.center = CGPoint(x: position.x, y: position.y)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let target = dropTarget {
            let position = touch.location(in: superview)
            if target.frame.contains(position) {
                NotificationCenter.default.post(NSNotification(name: Notification.Name(rawValue: "onTargetDropped"), object: nil) as Notification)
            }
        }
        self.center = originalPosition!
    }
}
