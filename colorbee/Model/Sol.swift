//
//  Sol.swift
//  colorbee
//
//  Created by Snoopy on 08/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit

class Sol: SKNode {
    
    func miseEnPlace(scene: SKScene) {
        position = CGPoint(x: scene.size.width / 2, y: 20)
        let body = SKPhysicsBody(rectangleOf: CGSize(width: scene.size.width, height: 1))
        body.categoryBitMask = MASK_SOL
        body.affectedByGravity = false
        body.isDynamic = false
        physicsBody = body
    }
}
