//
//  ViewController.swift
//  Tapper App
//
//  Created by Jesper Bertelsen on 23/01/2021.
//

import UIKit

class ViewController: UIViewController {
    //properties/variables
    var maxTaps = 0
    var currentTaps = 0
    
    
    //Outlets
    @IBOutlet weak var playbtn:UIButton!
    @IBOutlet weak var logoView:UIImageView!
    @IBOutlet weak var tapstext:UITextField!
    
    @IBOutlet weak var coinsbtn:UIButton!
    @IBOutlet weak var tapslbl:UILabel!
    
    @IBAction func onCoinBtnpres(sender: UIButton!) {
        currentTaps+=1;
        updateCurrentTaps()
        
        if isGameOver() {
            restartGame()
        }
        
            
    }

    @IBAction func onPlayBtnPress(sender: UIButton!) {
               
        //.text tager teksten derfra. Nil betyder empty
        if tapstext.text != nil && tapstext.text != ("") {
            maxTaps = Int(tapstext.text!)!
            currentTaps = 0
            updateCurrentTaps()
            
            gameIsActive()
        }
            
    }
    func restartGame() {
        maxTaps = 0
        tapstext.text = ""
        gameIsStandby()
        
            
        }
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func updateCurrentTaps() {
        tapslbl.text = "\(maxTaps - currentTaps) Taps left"
        }
    

    func gameIsActive() {
        logoView.isHidden = true
        playbtn.isHidden = true
        tapstext.isHidden = true
        
        tapslbl.isHidden = false
        coinsbtn.isHidden = false
    }
    
    func gameIsStandby() {
        logoView.isHidden = false
        playbtn.isHidden = false
        tapstext.isHidden = false
        
        tapslbl.isHidden = true
        coinsbtn.isHidden = true
    }
}




