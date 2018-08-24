//
//  GameScene.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	/// GameViewControl setup as reference to handle SceneStates
	var gameVC: GameViewController!
	
	///  Controls
	var goToMenuButton: GoToMenuButton!

	private var lastUpdateTime : TimeInterval = 0
	
	/// Custom Initializer
	init(gameVC: GameViewController){

		/// Set GameViewControl
		self.gameVC = gameVC
		super.init(size: gameVC.gameSKView.bounds.size)
		
		/// Config Controls
		goToMenuButton = GoToMenuButton.init(inThisScene: self)
	}
	
	/// Included because is a requisite if a custom Init is used
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	/// Present Elements to the Scene
	override func didMove(to view: SKView) {
		/// Present controls
		self.addChild(goToMenuButton.exitButtonSprite)
		self.addChild(goToMenuButton.labelTitle)
		self.addChild(goToMenuButton.shape)
	}
	
	/// Before another Scence will be presented
	override func willMove(from view: SKView) {
		removeAllChildren()
	}

	func touchDown(atPoint pos : CGPoint) {
		if let n = goToMenuButton.spinnyNode?.copy() as! SKShapeNode? {
			n.position = pos
			n.strokeColor = SKColor.green
			self.addChild(n)
		}
	}
	
	func touchMoved(toPoint pos : CGPoint) {
		if let n = goToMenuButton.spinnyNode?.copy() as! SKShapeNode? {
			n.position = pos
			n.strokeColor = SKColor.blue
			self.addChild(n)
		}
	}
	
	func touchUp(atPoint pos : CGPoint) {
		if let n = goToMenuButton.spinnyNode?.copy() as! SKShapeNode? {
			n.position = pos
			n.strokeColor = SKColor.red
			self.addChild(n)
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches {
			let location = t.location(in: self)
			let item = atPoint(location)
			
			/// Exit and go to Next Scene
			if (item.name == "button-GoMenu") || (item.name == "button-GoMenu") {
				gameVC.sceneStateMachine.enter(MenuState.self)
			}
			else {
				self.touchDown(atPoint: t.location(in: self))
			}
		}
	}
	
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchUp(atPoint: t.location(in: self)) }
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchUp(atPoint: t.location(in: self)) }
	}
}
