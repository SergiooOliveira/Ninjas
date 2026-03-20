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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchlocation = touches.first else { return }
        let location = touchlocation.location(in: self)
        
        let projectile = SKSpriteNode(imageNamed: "projectile")
        projectile.position = CGPoint(x: player.position.x + projectile.size.width + 0.2, y: player.position.y)
        
        addChild(projectile)
        
        let dx = location.x - projectile.position.x
        let dy = location.y - projectile.position.y
        
        let angle = atan2(dy, dx)
        
        let distance: CGFloat = size.width * 0.5
        
        let destination = CGPoint(
            x: projectile.position.x + cos(angle) * distance,
            y: projectile.position.y + sin(angle) * distance
        )
        
        // sqrt(x^2, y^2
        
        let move = SKAction.move(to: destination, duration: 2)
        projectile.run(SKAction.sequence([move, SKAction.removeFromParent()]))
    }
}
