//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Steve Henderson on 2016-05-08.
//  Copyright © 2016 Steve Henderson. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: properties
    var userPicked:String?
    var gamePicked:String?
    
    // MARK: outlets
    @IBOutlet weak var resultsImage: UIImageView!
    @IBOutlet weak var resultsLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        resultsLabel.text = resultText()
        
        //            didWin ? "Winner! \(userPicked!) beats \(gamePicked!)" : "Loser! \(userPicked!) loses to \(gamePicked!)"
    }
    
    // MARK: tapped events
    @IBAction func playAgainTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: custom methods
    
    func resultText() -> String{
        var text:String
        
        switch userPicked! {
        case "rock":
            if gamePicked! == "rock" {
                self.resultsImage.image = UIImage(named: "itsATie")
                text = "Tie, \(userPicked!) ties \(gamePicked!)"
            } else if gamePicked! == "scissor" {
                self.resultsImage.image = UIImage(named: "RockCrushesScissors")
                text = "Win, \(userPicked!) beats \(gamePicked!)"
            } else {
                self.resultsImage.image = UIImage(named: "PaperCoversRock")
                text = "Lose, \(userPicked!) loses to \(gamePicked!)"
            }
        case "paper":
            if gamePicked! == "paper" {
                self.resultsImage.image = UIImage(named: "itsATie")
                text = "Tie, \(userPicked!) ties \(gamePicked!)"
            } else if gamePicked! == "rock" {
                self.resultsImage.image = UIImage(named: "PaperCoversRock")
                text = "Win, \(userPicked!) beats \(gamePicked!)"
            } else {
                self.resultsImage.image = UIImage(named: "ScissorsCutPaper")
                text = "Lose, \(userPicked!) loses to \(gamePicked!)"
            }
        case "scissor":
            if gamePicked! == "scissor" {
                self.resultsImage.image = UIImage(named: "itsATie")
                text = "Tie, \(userPicked!) ties \(gamePicked!)"
            } else if gamePicked! == "paper" {
                self.resultsImage.image = UIImage(named: "ScissorsCutPaper")
                text = "Win, \(userPicked!) beats \(gamePicked!)"
            } else {
                self.resultsImage.image = UIImage(named: "RockCrushesScissors")
                text = "Lose, \(userPicked!) loses to \(gamePicked!)"
            }
        default:
            self.resultsImage.image = UIImage(named: "itsATie")
            text = "Its a tie!"
        }
        
        return text
    }
}
