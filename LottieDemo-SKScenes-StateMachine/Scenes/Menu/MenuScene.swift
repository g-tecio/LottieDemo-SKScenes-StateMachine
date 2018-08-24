//
//  Menu.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import Lottie
import GameplayKit

class MenuScene: SKScene {
	
	// GameViewControl setup as reference to handle SceneStates
	var gameVC: GameViewController!
	
	//  Controls
	var menuButtons: MenuButtons!
	
	private var lastUpdateTime : TimeInterval = 0
	
	/// Custom Initializer
	init(gameVC: GameViewController){
		// Set GameViewControl
		self.gameVC = gameVC
		super.init(size: gameVC.gameSKView.bounds.size)
		
		// Config Controls
		menuButtons = MenuButtons.init(inThisScene: self)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func didMove(to view: SKView) {
		// Present controls
		self.addChild(menuButtons.gameButton)
		self.addChild(menuButtons.configButton)
		self.addChild(menuButtons.giftButton)
		self.addChild(menuButtons.recordsButton)
	}
	
	override func willMove(from view: SKView) {
		removeAllChildren()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for touch in touches {
			let location = touch.location(in: self)
			let item = atPoint(location)
			
			/// Exit and go to Next Scene
			if (item.name == "gameButton") || (item.name == "gameButton") {
				gameVC.sceneStateMachine.enter(GameState.self)
			}
			if (item.name == "configButton") || (item.name == "configButton") {
				gameVC.sceneStateMachine.enter(ConfigState.self)
			}
			if (item.name == "giftButton") || (item.name == "giftButton") {
				gameVC.sceneStateMachine.enter(GiftState.self)
			}
			if (item.name == "recordsButton") || (item.name == "recordsButton") {
				gameVC.sceneStateMachine.enter(RecordsState.self)
			}
		}
	}
	
}
