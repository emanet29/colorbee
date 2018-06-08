//
//  Carre.swift
//  colorbee
//
//  Created by Snoopy on 08/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit

class Carre: Obstacle {
    override func miseEnPlace() {
        super.miseEnPlace()
    }
    
    override func creerForme() -> UIBezierPath? {
        return UIBezierPath(roundedRect: CGRect(x: -200, y: -200, width: 40, height: 40), cornerRadius: 50)
    }
    
}
