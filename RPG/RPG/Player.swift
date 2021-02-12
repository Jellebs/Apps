//
//  player.swift
//  RPG
//
//  Created by Jesper Bertelsen on 09/02/2021.
//

import Foundation

class Player: Character {
    private var _name = "player"
    
    var name: String {
        get {
            return _name
        }
    }
    private var _inventory = [String]()
    
    var inventory: [String] {
        get {
            return _inventory
        }
    }
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHp: hp, startingAttackPwr: attackPwr)
        
        _name = name
        
    }
    func AddItemToInventory(item: [String]) {
        _inventory.append(contentsOf: item)
    }

}
