//
//  InterfaceController.swift
//  tappityWatch Extension
//
//  Created by Saavan Dhaliwal on 31/5/17.
//  Copyright © 2017 Saavan Dhaliwal. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBOutlet var watchTimeLabel: WKInterfaceLabel!
    @IBOutlet var watchScoreLabel: WKInterfaceLabel!
    var score = 0
    var counter = 30
    var timerOn = false
    
    
    
    @IBAction func scoreIncreace(button: WKInterfaceButton) {
        if timerOn == false {
            score += 1
            watchScoreLabel.setText("\(score)")
            self.timerOn = true
            let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                self.counter -= 1
                self.watchTimeLabel.setText("\(self.counter)")
                if self.counter == 0 {
                    timer.invalidate()
                    self.endAlert()
                    self.score = 0
                    self.counter = 30
                    self.watchScoreLabel.setText("\(self.score)")
                    self.watchTimeLabel.setText("\(self.counter)")
                    self.timerOn = false
                    
                    
                }
            }} else {
            score += 1
            watchScoreLabel.setText("\(score)")
        }
        
    }
    
    func endAlert() {
        let firstAction = WKAlertAction(title: "Dismiss", style: WKAlertActionStyle.default) { () -> Void in
        }
        _ = self.presentAlert(withTitle: "Game Over", message: "You score is \(score)", preferredStyle: WKAlertControllerStyle.actionSheet, actions: [firstAction])
    }
    
    
}





















