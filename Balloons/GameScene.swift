//
//  GameScene.swift
//  Balloons
//
//  Created by Katlyn Schwaebe on 8/21/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    var centerPoint = CGPointMake(0, 0)
    var balloons:[SKSpriteNode] = []
    override func didMoveToView(view: SKView) {
        
        centerPoint = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame))
        //self.physicsWorld.gravity = CGVectorMake(0,-9.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.contactDelegate = self
        
        for i in 0...9 {
            var spriteNode = SKSpriteNode(imageNamed: "balloon_gold")
            spriteNode.xScale = 0.5
            spriteNode.yScale = 0.5
            
            spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: spriteNode.frame.size.width/2.0)
            spriteNode.physicsBody.restitution = 0.8
            spriteNode.physicsBody.mass = 0.2
            spriteNode.physicsBody.categoryBitMask = 1
    
            var floatI = CGFloat(i)
            
    
//size: CGSizeMake(50, 50))
//spriteNode = SKShapeNode(ellipseInRect: CGRectMake(0, 0, 10, 20))
// var spriteNode = SKSpriteNode(color: UIColor.greenColor(),size: CGSizeMake(50, 50))
            //SPACES NOW MATTER AFTER "=" sign ARTHUR
            //spriteNode.physicsBody = SKPhysicsBody(circleOfRadius:spriteNode.frame.size.width/2.0)
            spriteNode.position = CGPointMake(self.frame.width / 10.0 * floatI, 300.0)
            
            self.addChild(spriteNode)
            balloons += [spriteNode]
            //println(spriteNode)
        
        }
           }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            
            let location = touch.locationInNode(self)
            var dart = SKSpriteNode(imageNamed: "Dart")
            dart.position = location
            dart.physicsBody = SKPhysicsBody(rectangleOfSize: dart.frame.size)
            dart.physicsBody.contactTestBitMask = 1
            
            self.addChild(dart)
        
                  }
    }
   
    func didBeginContact(contact: SKPhysicsContact!) {
        for balloon in balloons {
        if balloon == contact.bodyA.node || balloon == contact.bodyB.node
        {
            
            balloon.removeFromParent()
            var pop = SKAction.playSoundFileNamed("pop.mp3", waitForCompletion: false)
            self.runAction(pop)
            
        }
    }
        
    }
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
