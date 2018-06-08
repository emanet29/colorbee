//
//  Joueur.swift
//  colorbee
//
//  Created by Snoopy on 08/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit

class Joueur: SKShapeNode {
    
    func miseEnPlace(scene: SKScene) {
        changerDeCouleur()
        position = CGPoint(x: scene.size.width / 2, y: scene.size.height / 2)
        let body = SKPhysicsBody(circleOfRadius: 25)
        body.affectedByGravity = true
        body.categoryBitMask = MASK_JOUEUR
        body.collisionBitMask = MASK_SOL
        body.mass = 1.5
        physicsBody = body
    }
    
    func sauter() {
        physicsBody?.velocity.dy = 500
    }
    
    func changerDeCouleur() {
        let couleur = COULEURS[Int(arc4random_uniform(UInt32(4)))]
        fillColor = couleur
        strokeColor = couleur
    }
}
