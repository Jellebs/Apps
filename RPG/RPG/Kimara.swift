//
//  Kimara.swift
//  RPG
//
//  Created by Jesper Bertelsen on 09/02/2021.
//

import Foundation

class Kimara: Enemy {
    let immuninty = 15
    
    override var loot: [String] {
        return ["Hard leather", "Shiny blade", "Rare trident"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr <= immuninty {
            return false
        } else {
            return super.attemptAttack(attackPwr: attackPwr)
        }
    }
}


