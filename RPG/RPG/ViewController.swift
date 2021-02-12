//
//  ViewController.swift
//  RPG
//
//  Created by Jesper Bertelsen on 09/02/2021.
//

import UIKit

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var ChestBtn: UIButton!
    @IBOutlet weak var AttackedByLbl: UILabel!
    @IBOutlet weak var EnemyHP: UILabel!
    @IBOutlet weak var PlayerHP: UILabel!
    @IBOutlet weak var EnemyImg: UIImageView!
    
    //variables
    var enemy: Enemy!
    var chestmessage: String?
    var player: Player!
    
    
    
    override func viewDidLoad() {
        
        enemy = Kimara(startingHp: 100, startingAttackPwr: 10)
        randomEnemy()
        player = Player(name: "Jellebs", hp: 111, attackPwr: 16)
        
        PlayerHP.text = "\(player.hp)"
               
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ChestBtn.isHidden = true
    
    }
    
    func enemyMessage() {
        AttackedByLbl.text = "Suddently a dangerous \(enemy.type) appeared!"
    }
        
    func randomEnemy() {
        let rand = Int(arc4random_uniform(UInt32(enemy.enemies.count)))
        if rand == 0 {
            enemy = Kimara(startingHp: 150, startingAttackPwr: 10)
            enemyMessage()
        } else {
            enemy = DevilWizard(startingHp: 90, startingAttackPwr: 12)
        }
        EnemyHP.text = "\(enemy.hp)"
    }
    
    @IBAction func OnAttackPressed(_ sender: UIButton) {
        if enemy.attemptAttack(attackPwr: player.attackPwr) {
            AttackedByLbl.text = ("\(enemy.type) was hit by \(player.name) for \(player.attackPwr)")
            EnemyHP.text = "\(enemy.hp)"
            
        } else {
            AttackedByLbl.text = "The attack was unsuccesful"
        }
        
//        if let loot = enemy.dropLoot() {
//            AttackedByLbl.text = "\(player.name) found \(loot)"
//        }
        if !enemy.isAlive {
            ChestBtn.isHidden = false
            EnemyImg.isHidden = true
            if enemy.lootReceived == false {
                if let loot = enemy.dropLoot() {
                    chestmessage = "\(player.name) found \(loot)"
                }
            }
        }
    }

    @IBAction func OnChestTapped() {
        player.AddItemToInventory(item: ["\(enemy.loot)"])
        AttackedByLbl.text = chestmessage
        ChestBtn.isHidden = true
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(nextFight), userInfo: nil, repeats: false)
    }
    
    @objc func nextFight() {
        randomEnemy()
        EnemyImg.isHidden = false
        enemyMessage()
    }
}
        
       
                
            
        
 

