//
//  MenuButtons.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/24/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit

struct MenuButtons {
	
	// Game Button and Label
	let gameButton:SKSpriteNode
	let gameLabel: SKLabelNode
	
	// Config Button and Label
	let configButton:SKSpriteNode
	let configLabel: SKLabelNode
	
	/// Gift Button and Label
	let giftButton:SKSpriteNode
	let giftLabel: SKLabelNode
	
	/// Records Button and Label
	let recordsButton:SKSpriteNode
	let recordsLabel: SKLabelNode
	
	init(inThisScene: SKScene) {
		
		/// Game Button
		gameButton = SKSpriteNode.init(imageNamed: "RedButton")
		gameButton.name = "gameButton"
		gameButton.zPosition = 1
		gameButton.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*8/10))
		
		/// Resizing depending to screen size
		let resizeFactorX:CGFloat = inThisScene.size.width/380.0
		let resizeFactorY:CGFloat = inThisScene.size.height/850.0
		let gameSize = gameButton.size
		gameButton.size = CGSize(width: gameSize.width*resizeFactorX, height: gameSize.height*resizeFactorY)
		
		/// Game label
		gameLabel = SKLabelNode.init(text: "Game")
		gameLabel.name = "gameButton"
		gameLabel.fontName = "Avenir-Heavy"
		gameLabel.horizontalAlignmentMode = .center
		gameLabel.verticalAlignmentMode = .center
		gameLabel.fontColor = .white
		gameLabel.fontSize = 20
		gameLabel.zPosition = 2
		gameLabel.position = CGPoint(x: 0, y: 0)
		
		/// Add Label to Scene
		gameButton.addChild(gameLabel)
		
		/// Config  Button
		configButton = SKSpriteNode.init(imageNamed: "RedButton")
		configButton.name = "configButton"
		configButton.zPosition = 1
		configButton.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*6/10))
		
		/// Resizing depending to screen size
		let configSize = configButton.size
		configButton.size = CGSize(width: configSize.width*resizeFactorX, height: configSize.height*resizeFactorY)
		
		/// Config config label
		configLabel = SKLabelNode.init(text: "Config")
		configLabel.name = "configButton"
		configLabel.fontName = "Avenir-Heavy"
		configLabel.horizontalAlignmentMode = .center
		configLabel.verticalAlignmentMode = .center
		configLabel.fontColor = .white
		configLabel.fontSize = 20
		configLabel.zPosition = 2
		configLabel.position = CGPoint(x: 0, y: 0)
		
		/// Add Label to Scene
		configButton.addChild(configLabel)
		
		/// Gift  Button
		giftButton = SKSpriteNode.init(imageNamed: "RedButton")
		giftButton.name = "giftButton"
		giftButton.zPosition = 1
		giftButton.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*4/10))
		
		/// Resizing depending to screen size
		let giftSize = giftButton.size
		giftButton.size = CGSize(width: giftSize.width*resizeFactorX, height: giftSize.height*resizeFactorY)
		
		/// Gift label
		giftLabel = SKLabelNode.init(text: "Gift")
		giftLabel.name = "giftButton"
		giftLabel.fontName = "Avenir-Heavy"
		giftLabel.horizontalAlignmentMode = .center
		giftLabel.verticalAlignmentMode = .center
		giftLabel.fontColor = .white
		giftLabel.fontSize = 20
		giftLabel.zPosition = 2
		giftLabel.position = CGPoint(x: 0, y: 0)
		
		/// Add Label to Scene
		giftButton.addChild(giftLabel)
		
		/// Records Button
		recordsButton = SKSpriteNode.init(imageNamed: "RedButton")
		recordsButton.name = "recordsButton"
		recordsButton.zPosition = 1
		recordsButton.position = CGPoint(x: inThisScene.size.width/2, y: (inThisScene.size.height*2/10))
		
		/// Resizing depending to screen size
		let recordsSize = recordsButton.size
		recordsButton.size = CGSize(width: recordsSize.width*resizeFactorX, height: recordsSize.height*resizeFactorY)
		
		/// Records label
		recordsLabel = SKLabelNode.init(text: "Records")
		recordsLabel.name = "recordsButton"
		recordsLabel.fontName = "Avenir-Heavy"
		recordsLabel.horizontalAlignmentMode = .center
		recordsLabel.verticalAlignmentMode = .center
		recordsLabel.fontColor = .white
		recordsLabel.fontSize = 20
		recordsLabel.zPosition = 2
		recordsLabel.position = CGPoint(x: 0, y: 0)
		
		/// Add Label to Scene
		recordsButton.addChild(recordsLabel)
	}
	
}
