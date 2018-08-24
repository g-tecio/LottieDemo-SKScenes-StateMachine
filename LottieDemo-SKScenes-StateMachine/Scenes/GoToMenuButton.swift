//
//  GoToMenuButton.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/24/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit

struct GoToMenuButton {
	
	/// Exit Button and Label
	let exitButtonSprite:SKSpriteNode
	let exitLabel: SKLabelNode
	
	let labelTitle = SKLabelNode(fontNamed: "Helvetica Bold")
	let shape = SKShapeNode.init(rectOf: CGSize.init(width: 60, height: 60), cornerRadius: 3)
	let spinnyNode : SKShapeNode?
	
	init(inThisScene: SKScene) {
		
		/// Exit  Button
		exitButtonSprite = SKSpriteNode.init(imageNamed: "RedButton")
		exitButtonSprite.name = "exitButton"
		exitButtonSprite.zPosition = 1
		exitButtonSprite.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*1/13))
		
		/// Resizing depending to screen size
		let resizeFactorX:CGFloat = inThisScene.size.width/380.0
		let resizeFactorY:CGFloat = inThisScene.size.height/850.0
		let originalSize = exitButtonSprite.size
		exitButtonSprite.size = CGSize(width: originalSize.width*resizeFactorX, height: originalSize.height*resizeFactorY)
		
		/// Exit Game label
		exitLabel = SKLabelNode.init(text: "Return to Menu")
		exitLabel.name = "button-GoMenu"
		exitLabel.fontName = "Avenir-Heavy"
		exitLabel.horizontalAlignmentMode = .center
		exitLabel.verticalAlignmentMode = .center
		exitLabel.fontColor = .white
		exitLabel.fontSize = 20
		exitLabel.zPosition = 2
		exitLabel.position = CGPoint(x: 0, y: 0)
		
		/// Add Label to Scene
		exitButtonSprite.addChild(exitLabel)
		
		/// Label Title setup
		labelTitle.text = "This is Cool!!!"
		labelTitle.fontSize = 30
		labelTitle.fontColor = SKColor.green
		labelTitle.horizontalAlignmentMode = .center
		labelTitle.verticalAlignmentMode = .center
		labelTitle.zPosition = 2
		labelTitle.position = CGPoint(x: inThisScene.size.width/2.0, y: inThisScene.size.height*(3.0/4.0))
		labelTitle.name = "MainTitle"
		labelTitle.alpha = 0.0
		labelTitle.run(SKAction.repeatForever(SKAction.sequence([SKAction.fadeOut(withDuration: 1), SKAction.fadeIn(withDuration: 1)])))
		
		/// Shape
		shape.fillColor = SKColor.red
		shape.strokeColor = SKColor.red
		shape.glowWidth = 5.0
		shape.lineWidth = 1.0
		shape.position = CGPoint(x: inThisScene.size.width/2.0, y: inThisScene.size.height*(2/10))
		shape.zPosition = 3
		shape.run(SKAction.repeatForever(SKAction.group([ 	SKAction.rotate( byAngle: CGFloat(Double.pi), duration: 1),
															SKAction.sequence(	[	SKAction.fadeIn(withDuration: 1),
																					SKAction.fadeOut(withDuration: 1)
																				])
														])))
		
		// Create shape node to use during mouse interaction
		let w = (inThisScene.size.width + inThisScene.size.height) * 0.05
		self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
		
		if let spinnyNode = self.spinnyNode {
			spinnyNode.lineWidth = 1.0
			
			spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
			spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
											  SKAction.fadeOut(withDuration: 0.5),
											  SKAction.removeFromParent()]))
		}
	}
}
