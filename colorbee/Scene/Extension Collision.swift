//
//  Extension Collision.swift
//  colorbee
//
//  Created by Snoopy on 09/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit
extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        if let node1 = contact.bodyA.node as? SKShapeNode {
            if let node2 = contact.bodyB.node as? SKShapeNode {
                if node1.fillColor != node2.fillColor {
                    // GAME OVER
                    gameOver()
                }
                
                
            }
        }
    }
    
}
