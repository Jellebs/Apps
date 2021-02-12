//
//  DevilWizard.swift
//  RPG
//
//  Created by Jesper Bertelsen on 09/02/2021.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic Wand", "Magic Dust", "Dark Amulet"]
    }
    override var type: String {
        return "DevilWizard"
    }
    
}
