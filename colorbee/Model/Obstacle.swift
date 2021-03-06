//
//  Obstacle.swift
//  colorbee
//
//  Created by Snoopy on 08/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit

class Obstacle: SKNode {
    
    func miseEnPlace(){
        guard let path = creerForme() else { return }
        zPosition = 0
        for x in (0...3) {
            let quart = SKShapeNode(path: path.cgPath)
            quart.fillColor = COULEURS[x]
            quart.strokeColor = COULEURS[x]
            quart.zRotation = CGFloat(Double.pi / 2) * CGFloat(x)
            
            let body = SKPhysicsBody(polygonFrom: path.cgPath)
            body.categoryBitMask = MASK_OBSTACLE
            body.collisionBitMask = MASK_PERSONNE
            body.contactTestBitMask = MASK_JOUEUR
            body.affectedByGravity = false
            quart.physicsBody = body
            addChild(quart)
            
        }
        
        let action = SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 2)
        let repetition = SKAction.repeatForever(action)
        run(repetition)
    }
    
    func creerForme() -> UIBezierPath? {
        
        return nil
    }
}
