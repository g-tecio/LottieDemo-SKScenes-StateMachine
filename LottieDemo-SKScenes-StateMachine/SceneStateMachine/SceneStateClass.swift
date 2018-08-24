//
//  SceneStateClass.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/24/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import SpriteKit
import GameplayKit

class SceneStateClass: GKState {
	
	let gameVC: GameViewController
	let sceneStateName: String
	
	init(gameVC: GameViewController, sceneStateName: String) {
		self.gameVC = gameVC
		self.sceneStateName = sceneStateName
	}
	
	// MARK: Overrride Methos
	
	override func didEnter(from previousState: GKState?) {
		print("Entering state: \(sceneStateName)")
	}
	
	override func willExit(to nextState: GKState) {
		print("Exiting state: \(sceneStateName)")
	}
}
