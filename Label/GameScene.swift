//
//  GameScene.swift
//  Label
//
//  Created by Shogun Karamazov on 31/01/2017.
//  Copyright © 2017 AppCoda. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
  
  let label = SKLabelNode(text: "Hello SpriteKit!")
  
  override func didMove(to view: SKView) {
    
    label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
    label.fontSize = 45
    label.fontColor = SKColor.yellow
    label.fontName = "Avenir"
    addChild(label)
    
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
    view.addGestureRecognizer(recognizer)

  }
  
  func tap(recognizer: UIGestureRecognizer) {
    let viewLocation = recognizer.location(in: self.view)
    let sceneLocation = convertPoint(fromView: viewLocation)
    
    if label.contains(sceneLocation) {
        let move = SKAction.move(to: sceneLocation, duration: 1)
        let scale = SKAction.scaleX(by: 0.5, y: 2, duration: 1)
        let actions = [move, scale]
        let sequence = SKAction.sequence(actions)
        label.run(sequence)
    }
  }

}
