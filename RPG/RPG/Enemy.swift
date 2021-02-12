//
//  File.swift
//  RPG
//
//  Created by Jesper Bertelsen on 09/02/2021.
//

import Foundation

class Enemy: Character {
    
    var enemies: [String] {
        return ["Kamara", "DevilWizard"]
    }
    
    var loot: [String] {
        return ["Rusty dagger","Cracked buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    var lootReceived: Bool = false
    func dropLoot() -> String? {
        if !isAlive && lootReceived == false {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            //arc4random_uniform vælger et tilfældigt data nummer taget fra antalet af loot arrays(loot.count)
            return loot[rand]
        } else {
            return nil
        }
    }
    func LootRecieved() -> Bool {
        if lootReceived == false {
            return lootReceived == true
        } else {
            return false
        }
    }
}
