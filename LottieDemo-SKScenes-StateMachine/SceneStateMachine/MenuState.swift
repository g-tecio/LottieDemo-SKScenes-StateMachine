//
//  GameState.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class MenuState: SceneStateClass {
	
	required init(gameVC: GameViewController) {
		super.init(gameVC: gameVC, sceneStateName: "MenuState")
	}
	
	override func didEnter(from previousState: GKState?) {
		super.didEnter(from: previousState)
		
		// Play Animation continually
		gameVC.lottieAnimation.setAnimation(named: "gradient_animated_background")
		gameVC.lottieAnimation.loopAnimation = true
		gameVC.lottieAnimation.play()
		
		// Setup and Present Scene
		gameVC.menuScene.backgroundColor = UIColor.clear
		gameVC.menuScene.scaleMode = .resizeFill
		gameVC.gameSKView.presentScene(gameVC.menuScene)

	}
	
	override func willExit(to nextState: GKState) {
		super.willExit(to: nextState)
		
		gameVC.lottieAnimation.stop()
	}
	
	override func isValidNextState(_ stateClass: AnyClass) -> Bool {
		if 	(stateClass is GameState.Type) ||
			(stateClass is ConfigState.Type) ||
			(stateClass is GiftState.Type) ||
			(stateClass is RecordsState.Type)
		{
			return true
		}
		else {
			return false
		}
	}
	
}
