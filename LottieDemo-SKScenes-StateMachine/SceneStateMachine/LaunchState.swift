//
//  LaunchState.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class LaunchState: SceneStateClass {
	
	var pauseTimeCounter: TimeInterval = 0.0
	var timeForNextAction: TimeInterval = 0.0
	
	init(gameVC: GameViewController) {
		super.init(gameVC: gameVC, sceneStateName: "LaunchState")
	}
	
	override func didEnter(from previousState: GKState?) {
		super.didEnter(from: previousState)
		
		// Set timer and start counter
		pauseTimeCounter = 0.0
		timeForNextAction = 5.0
		
		// Play Animation continually
		gameVC.lottieAnimation.setAnimation(named: "loading")
		gameVC.lottieAnimation.loopAnimation = true
		gameVC.lottieAnimation.play()
		
		// Setup and Present Scene
		gameVC.launchScene.backgroundColor = UIColor.clear
		gameVC.launchScene.scaleMode = .resizeFill
		gameVC.gameSKView.presentScene(gameVC.launchScene)
	}
	
	override func update(deltaTime : TimeInterval) {
		/// Keep track of the time since the last update.
		pauseTimeCounter += deltaTime

		/// If an interval of pauseInterval has passed got to FredPlayingSequence state
		if pauseTimeCounter > timeForNextAction {
			gameVC.sceneStateMachine.enter(MenuState.self)
		}
	}
	
	override func willExit(to nextState: GKState) {
		super.willExit(to: nextState)
		
		gameVC.lottieAnimation.stop()
	}
	
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		if (stateClass is MenuState.Type)
		{
			return true
		}
		else {
			return false
		}
	}
	
}
