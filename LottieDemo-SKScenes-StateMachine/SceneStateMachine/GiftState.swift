//
//  GameState.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class GiftState: SceneStateClass {
	
	required init(gameVC: GameViewController) {
		super.init(gameVC: gameVC, sceneStateName: "GiftState")
	}
	
	override func didEnter(from previousState: GKState?) {
		super.didEnter(from: previousState)
		
		// Play Animation continually
		gameVC.lottieAnimation.setAnimation(named: "gift_popup")
		gameVC.lottieAnimation.loopAnimation = true
		gameVC.lottieAnimation.play()
		
		// Setup and Present Scene
		gameVC.giftScene.backgroundColor = UIColor.clear
		gameVC.giftScene.scaleMode = .resizeFill
		gameVC.gameSKView.presentScene(gameVC.giftScene)
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
