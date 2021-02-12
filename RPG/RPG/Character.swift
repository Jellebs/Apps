//
//  Character.swift
//  RPG
//
//  Created by Jesper Bertelsen on 09/02/2021.
//

import Foundation

class Character {
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            if _hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    init(startingHp: Int, startingAttackPwr: Int) {
        self._hp = startingHp
        self._attackPwr = startingAttackPwr
        
    }
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
}
