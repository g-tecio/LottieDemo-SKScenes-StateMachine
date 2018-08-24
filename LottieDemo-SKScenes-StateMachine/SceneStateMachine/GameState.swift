//
//  GameState.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameState: SceneStateClass {
	
	required init(gameVC: GameViewController) {
		super.init(gameVC: gameVC, sceneStateName: "GameState")
	}
	
	override func didEnter(from previousState: GKState?) {
		super.didEnter(from: previousState)
		
		// Play Animation continually
		gameVC.lottieAnimation.setAnimation(named: "rey_updated!")
		gameVC.lottieAnimation.loopAnimation = true
		gameVC.lottieAnimation.play()
		
		// Setup and Present Scene
		gameVC.gameScene.backgroundColor = UIColor.clear
		gameVC.gameScene.scaleMode = .resizeFill
		gameVC.gameSKView.presentScene(gameVC.gameScene)
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
