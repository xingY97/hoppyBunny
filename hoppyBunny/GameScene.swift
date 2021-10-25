//
//  GameScene.swift
//  hoppyBunny
//
//  Created by X Y on 10/25/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    class GameScene: SKScene {
        //connecting hero node
        var hero: SKSpriteNode!
        
        override func didMove(to view: SKView) {
            /* Setup your scene here */
            /* REcursive node search for 'hero' */
            hero = (self.childNode(withName: "//hero") as! SKSpriteNode)
            
            /* allows the hero to animate when it's in the gameScene*/
            hero.isPaused = false
        }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            /* Called when a touch begins */
        }
    
        override func update(_ currentTime: TimeInterval) {
            /* Called before each frame is rendered */
        }
    }
}
