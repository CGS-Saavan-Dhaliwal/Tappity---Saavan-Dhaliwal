//
//  ViewController.swift
//  Tappity
//
//  Created by Saavan Dhaliwal on 29/5/17.
//  Copyright © 2017 Saavan Dhaliwal. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    var score = 0
    var counter = 30
    var timerOn = false
    
    
    
    @IBAction func scoreIncreace(button: UIButton) {
        if timerOn == false {
            score += 1
            scoreLabel.text = "\(score)"
            self.timerOn = true
            let _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                self.counter -= 1
                self.timeLabel.text = "\(self.counter)"
                
                if self.counter == 0 {
                    timer.invalidate()
                    self.alert()
                    self.score = 0
                    self.counter = 30
                    self.scoreLabel.text = "\(self.score)"
                    self.timeLabel.text = "\(self.counter)"
                    self.view.backgroundColor = UIColor.blue
                    self.timerOn = false
                    button.center.x = button.superview!.bounds.width / 2
                    button.center.y = button.superview!.bounds.height / 2
                    
                    print("stop being acoustic")
                    
                }
            }} else {
            score += 1
            scoreLabel.text = "\(score)"
            
        }
        
        
        let colours = [UIColor.blue, UIColor.red, UIColor.green, UIColor.purple, UIColor.black, UIColor.orange, UIColor.yellow, UIColor.magenta, UIColor.gray, UIColor.brown]
        
        let randomNumber = Int(arc4random_uniform(UInt32(colours.count)))
        
        self.view.backgroundColor = (colours[randomNumber])
        
        
        
        // Find the button's width and height
        let buttonWidth = button.frame.width
        let buttonHeight = button.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = button.superview!.bounds.width
        let viewHeight = button.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        button.center.x = xoffset + buttonWidth / 2
        button.center.y = yoffset + buttonHeight / 2
        
    }
    
    
    
    func alert() {
        let alert = UIAlertController(title: "Game Over", message: "You score is \(score)", preferredStyle:UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func called() {
        let theSecondViewController = tabBarController?.viewControllers![1] as! ViewController2
        theSecondViewController.updateHighScores()
        
      
        
        
    }

}






