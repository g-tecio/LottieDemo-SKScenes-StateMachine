//
//  LaunchScene.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import Lottie
import GameplayKit

class LaunchScene: SKScene {
	
	// GameViewControl setup as reference to handle SceneStates
	var gameVC: GameViewController!
	
	// Keeps track of the time for use in the update method.
	var previousUpdateTime: TimeInterval = 0
	
	private var lastUpdateTime : TimeInterval = 0
	
	// Custom Initializer
	init(gameVC: GameViewController){
		/// Set GameViewControl
		self.gameVC = gameVC
		
		/// Set SKView
		super.init(size: gameVC.gameSKView.bounds.size)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func update(_ currentTime: TimeInterval) {
		// Set previousUpdateTime for the first time
		if previousUpdateTime == 0 {
			previousUpdateTime = currentTime
		}
		
		// For the states that have update(deltaTime:) send the delta time
		gameVC.sceneStateMachine.update(deltaTime: currentTime - previousUpdateTime)
		// Update previousUpdateTime to be current
		previousUpdateTime = currentTime
	}

	override func didMove(to view: SKView) {
		// Present controls
		
	}
	
	override func willMove(from view: SKView) {
		removeAllChildren()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
			gameVC.sceneStateMachine.enter(MenuState.self)
	}
}
