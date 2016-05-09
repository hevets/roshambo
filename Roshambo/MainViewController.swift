//
//  ViewController.swift
//  Roshambo
//
//  Created by Steve Henderson on 2016-05-08.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: properties
    enum gameResults: String {
        case Rock = "rock", Paper = "paper", Scissor = "scissor"
        static let allValues = [Rock, Paper, Scissor]
    }
    
    // MARK: viewcontorller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultsViewController
        
        // figure out what button was just tapped and generate proper values
        controller.userPicked = getPickValues()[(sender as! UIButton).tag]
        controller.gamePicked = generatePick()
    }

    // MARK: ui events
    @IBAction func paperTapped(sender: AnyObject) {
        performSegueWithIdentifier("presentResults", sender: sender)
    }
    
    @IBAction func rockTapped(sender: AnyObject) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
        
        controller.userPicked = getPickValues()[sender.tag]
        controller.gamePicked = generatePick()
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    // MARK: custom func
    func generatePick() -> String {
        // closure example to take my enum and convert it into an array of strings
        return getPickValues()[Int(arc4random() % 3)]
    }
    
    func getPickValues() -> [String] {
        return gameResults.allValues.map { (value) -> String in
            return value.rawValue
        }
    }

}

