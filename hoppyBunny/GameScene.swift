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
    
    
    
    //connecting hero node
    var hero: SKSpriteNode!
    
    var sinceTouch : CFTimeInterval = 0
    
    let fixedDelta: CFTimeInterval = 1.0 / 60.0 /* 60 FPS */
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
        /* REcursive node search for 'hero' */
        hero = (self.childNode(withName: "//hero") as! SKSpriteNode)
        
        /* allows the hero to animate when it's in the gameScene*/
        hero.isPaused = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        /* apply vertical impulse */
        hero.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 300))
        
        /* applu subtle rotation*/
        hero.physicsBody?.applyAngularImpulse(1)
        
        /*Reset touch timer */
        sinceTouch = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        /* Grab current velocity*/
        let velocityY = hero.physicsBody?.velocity.dy ?? 0
        
        /* check and cap vertical velocity */
        if velocityY > 400 {
            hero.physicsBody?.velocity.dy = 400
        }
        
        /* Apply falling rotation */
        if sinceTouch > 0.2 {
            let impulse = -20000 * fixedDelta
            hero.physicsBody?.applyAngularImpulse(CGFloat(impulse))
        }
        
        /* Clamp rotation */
        hero.zRotation.clamp(v1: CGFloat(-90).degreesToRadians(), CGFloat(30).degreesToRadians())
        hero.physicsBody?.angularVelocity.clamp(v1: -1, 3)
        
        /* Update last touch timer */
        sinceTouch += fixedDelta
        
    }
    
}
