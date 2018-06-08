//
//  MonLabel.swift
//  colorbee
//
//  Created by Snoopy on 08/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit

class MonLabel: SKLabelNode {
    
    func miseEnPlace(x: CGFloat, y: CGFloat) {
        position = CGPoint(x: x, y: y)
        fontName = "Helvetica Neue"
        fontColor = .white
        fontSize = 100
        numberOfLines = 2
    }
    
    func ajoutTexte(_ string: String){
        text = string
    }
}
