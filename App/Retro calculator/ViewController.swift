//
//  ViewController.swift
//  Retro calculator
//
//  Created by Jesper Bertelsen on 30/01/2021.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    //Aktiv app
    @IBOutlet weak var Talknap0: UIButton!
    @IBOutlet weak var Talknap1: UIButton!
    @IBOutlet weak var Talknap2: UIButton!
    @IBOutlet weak var Talknap3: UIButton!
    @IBOutlet weak var Talknap4: UIButton!
    @IBOutlet weak var Talknap5: UIButton!
    @IBOutlet weak var Talknap6: UIButton!
    @IBOutlet weak var Talknap7: UIButton!
    @IBOutlet weak var Talknap8: UIButton!
    @IBOutlet weak var Talknap9: UIButton!
    @IBOutlet weak var Dividere: UIButton!
    @IBOutlet weak var Gange: UIButton!
    @IBOutlet weak var Minus: UIButton!
    @IBOutlet weak var Plus: UIButton!
    @IBOutlet weak var erLigeMed: UIButton!
    @IBOutlet weak var Outputlbl: UILabel!
    @IBOutlet weak var Backpanel: UIImageView!
    @IBOutlet weak var Baggrund: UIImageView!
    @IBOutlet weak var Månen: UIImageView!
    
    //Launch screen
    @IBOutlet weak var Launchbund: UIImageView!
    @IBOutlet weak var LaunchBg: UIImageView!
    @IBOutlet weak var LogoBot: UIStackView!
    
    var btnSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftValString = ""
    var rightValString = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundUrl as URL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        appIsPassive()
    }
    @IBAction func LaunchStart(_ sender: Any) {
        appIsActive()
    }
    
    @IBAction func ClearPressed(_ sender: Any) {
        runningNumber = ""
        leftValString = ""
        rightValString = ""
        currentOperation = Operation.Empty
        result = "0"
        Outputlbl.text = result
    }
    
    
    @IBAction func NumberPressed(btn: UIButton!) {
        playSound()
        runningNumber += "\(btn.tag)"
        Outputlbl.text = runningNumber
    }

    @IBAction func OnDividePressed(_ sender: Any) {
        processOperation(op:Operation.Divide)
    }
    
    @IBAction func OnMultiplyPressed(_ sender: Any) {
        processOperation(op:Operation.Multiply)
    }
    
    @IBAction func OnSubtractPressed(_ sender: Any) {
        processOperation(op:Operation.Subtract)
    }
    
    @IBAction func OnAddPressed(_ sender: Any) {
        processOperation(op:Operation.Add)
    }
    
    @IBAction func OnEqualPressed(_ sender: Any) {
        processOperation(op:currentOperation)
    }
    func processOperation(op:Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            //run some Math
            if runningNumber != "" {
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
               
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                    
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                }
                
                leftValString = result
                Outputlbl.text = result
                
                currentOperation = op
            }
            
            
        } else {
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = op
            
        }
    }
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        btnSound.play()
    }
    func appIsActive() {
        Outputlbl.isHidden = false
        Talknap0.isHidden = false
        Talknap1.isHidden = false
        Talknap2.isHidden = false
        Talknap3.isHidden = false
        Talknap4.isHidden = false
        Talknap5.isHidden = false
        Talknap6.isHidden = false
        Talknap7.isHidden = false
        Talknap8.isHidden = false
        Talknap9.isHidden = false
        Baggrund.isHidden = false
        Backpanel.isHidden = false
        Månen.isHidden = false
        
        Launchbund.isHidden = true
        LaunchBg.isHidden = true
        LogoBot.isHidden = true
    }
    
    func appIsPassive() {
        Launchbund.isHidden = false
        LaunchBg.isHidden = false
        LogoBot.isHidden = false
        Outputlbl.isHidden = true
        Talknap0.isHidden = true
        Talknap1.isHidden = true
        Talknap2.isHidden = true
        Talknap3.isHidden = true
        Talknap4.isHidden = true
        Talknap5.isHidden = true
        Talknap6.isHidden = true
        Talknap7.isHidden = true
        Talknap8.isHidden = true
        Talknap9.isHidden = true
        Baggrund.isHidden = true
        Backpanel.isHidden = true
        Månen.isHidden = true
    }
    


}


