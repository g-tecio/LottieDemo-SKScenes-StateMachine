//
//  GameViewController.swift
//  LottieDemo-SKScenes-StateMachine
//
//  Created by Fernando Vazquez on 8/23/18.
//  Copyright © 2018 Cartwheel Galaxy Games. All rights reserved.
//

import UIKit
import Lottie
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
	
	// Scene State Machine
	var sceneStateMachine: GKStateMachine!
	
	var lottieAnimation: LOTAnimationView!
	var gameSKView: SKView!

	// Scenes
	var launchScene: LaunchScene!
	var menuScene: MenuScene!
	var gameScene: GameScene!
	var configScene: ConfigScene!
	var giftScene: GiftScene!
	var recordsScene: RecordsScene!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Backgound Color of the SuperView
		view.backgroundColor = UIColor.black
		
		// Setup animaitonView
		lottieAnimation = LOTAnimationView()
		lottieAnimation.contentMode = .scaleAspectFit
		lottieAnimation.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
		lottieAnimation.center = self.view.center
		lottieAnimation.backgroundColor = UIColor.clear
		view.addSubview(lottieAnimation)
		
		// Setup SKView
		gameSKView = SKView.init(frame: self.view.bounds)
		gameSKView.contentMode = .scaleToFill
		gameSKView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
		gameSKView.center = self.view.center
		gameSKView.allowsTransparency = true
		view.addSubview(gameSKView)
	
		// Performance monitoring of SpriteKit
		gameSKView.ignoresSiblingOrder = true
		gameSKView.showsFPS = true
		gameSKView.showsNodeCount = true
		
		// Scenes Setup
		launchScene = LaunchScene.init(gameVC: self)
		menuScene = MenuScene.init(gameVC: self)
		gameScene = GameScene.init(gameVC: self)
		configScene = ConfigScene.init(gameVC: self)
		giftScene = GiftScene.init(gameVC: self)
		recordsScene = RecordsScene.init(gameVC: self)
		
		/// Creates SceneStateMachine and adds states, then enters GameSceneState
		sceneStateMachine = GKStateMachine(states: [	LaunchState(gameVC: self),
														MenuState(gameVC: self),
														GameState(gameVC: self),
														ConfigState(gameVC: self),
														GiftState(gameVC: self),
														RecordsState(gameVC: self)	] )
		sceneStateMachine.enter(LaunchState.self)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
