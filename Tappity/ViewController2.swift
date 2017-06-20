//
//  ViewController2.swift
//  Tappity
//
//  Created by Saavan Dhaliwal on 1/6/17.
//  Copyright © 2017 Saavan Dhaliwal. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet var scoreOne: UILabel!
    @IBOutlet var scoreTwo: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        let theFirstViewController = tabBarController?.viewControllers![0] as! ViewController
        theFirstViewController.called()
    }

    
    
    func updateHighScores() {
        print(scoreTwo)
    }
    
    

}
