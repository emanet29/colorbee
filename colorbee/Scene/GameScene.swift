//
//  GameScene.swift
//  colorbee
//
//  Created by Snoopy on 08/06/2018.
//  Copyright © 2018 EMANET. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let cameraNode = SKCameraNode()
    let sol = Sol()
    var joueur: Joueur?
    var scoreLabel = MonLabel()
    var scoreDuJoueur = 0
    var obstacles = [Obstacle]()
    let espacement: CGFloat = 750
    var gameOverLabel: MonLabel?
    
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity.dy = -5
        physicsWorld.contactDelegate = self
        
        camera = cameraNode
        addChild(cameraNode)
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        sol.miseEnPlace(scene: self)
        addChild(sol)
        
        scoreLabel.miseEnPlace(x: -(UIScreen.main.bounds.width / 1.5), y: -(UIScreen.main.bounds.height / 1.5))
        scoreLabel.ajoutTexte(String(scoreDuJoueur))
        cameraNode.addChild(scoreLabel)
        
        ajouterJoueur()
        
        for _ in (0...2) {
            ajouterObstacle()
        }
    }
    
    func ajouterJoueur(){
        joueur = Joueur(circleOfRadius: 25)
        joueur?.miseEnPlace(scene: self)
        if joueur != nil {
            addChild(joueur!)
        }
    
    }
    
    func ajouterObstacle() {
        let obstacle: Obstacle?
        if aleatoire() {
            obstacle = Cercle()
        } else {
            obstacle = Carre()
        }
        obstacle?.miseEnPlace()
        if obstacle != nil {
            obstacles.append(obstacle!)
            obstacle?.position = CGPoint(x: cameraNode.frame.midX, y: espacement * CGFloat(obstacles.count))
            addChild(obstacle!)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if joueur != nil {
            joueur?.sauter()
        }
        if gameOverLabel != nil {
            gameOverLabel?.removeFromParent()
            gameOverLabel = nil
            ajouterJoueur()
            for _ in (0...2) {
                ajouterObstacle()
            }
            scoreDuJoueur = 0
            scoreLabel.ajoutTexte(String(0))
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    func gameOver() {
        if joueur != nil {
            joueur?.removeFromParent()
            joueur = nil
        }
        for obstacle in obstacles {
            obstacle.removeFromParent()
        }
        obstacles.removeAll()
        gameOverLabel = MonLabel()
        gameOverLabel?.miseEnPlace(x: 0, y: 0)
        gameOverLabel?.ajoutTexte("Game OVER \n Score: " + String(scoreDuJoueur))
        if gameOverLabel != nil {
            cameraNode.addChild(gameOverLabel!)
        }
    }
    
    
    
    
    
    
    
    
}
