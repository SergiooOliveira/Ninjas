//
//  GameScene.swift
//  Ninjas
//
//  Created by Sérgio Oliveira on 20/03/2026.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = SKSpriteNode(imageNamed: "player")
    var monsters = [SKSpriteNode(imageNamed: "monster")]
    
    override func didMove(to view: SKView) {
        backgroundColor = .gray
        player.position = CGPoint(x: size.width * 0.1, y: size.height/2)
        addChild(player)
        
        addMonster()
        
        let wait = SKAction.wait(forDuration: 1.0)
        let add = SKAction.run{ self.addMonster() }
        
        run(SKAction.repeatForever(SKAction.sequence([wait, add])))
    }
    
    func addMonster() {
        let monster = SKSpriteNode(imageNamed: "monster")
        
        let x = CGFloat.random(in: monster.size.width/2 + (size.width * 0.15) ..< size.width - monster.size.width-2)
        let y = CGFloat.random(in: monster.size.height/2 ..< size.height - monster.size.height-2)
        
        monster.position = CGPoint(x: x, y: y)
        monsters.append(monster)
        
        addChild(monster)
        
        let move = SKAction.move(to: CGPoint(x: -monster.size.width, y: y), duration: 2)
        monster.run(SKAction.sequence([move, SKAction.removeFromParent()]))
        
    }
    
    func moveMonster() {
        
    }
}
