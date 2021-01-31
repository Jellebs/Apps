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
    
    @IBOutlet weak var Outputlbl: UILabel!
    
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
}


