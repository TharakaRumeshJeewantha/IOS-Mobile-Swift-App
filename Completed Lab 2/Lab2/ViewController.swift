//
//  ViewController.swift
//  Lab2
//
//  Created by Admin on 7/28/2561 BE.
//  Copyright © 2561 BE Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainBtn.layer.cornerRadius = 5
       
        let inset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let leftNew = #imageLiteral(resourceName: "SliderTrackLeft").resizableImage(withCapInsets: inset)
        let rightNew = #imageLiteral(resourceName: "SliderTrackRight").resizableImage(withCapInsets: inset)
        slider.setMaximumTrackImage(rightNew, for: .normal)
        slider.setMinimumTrackImage(leftNew, for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Normal"), for: .normal)
        slider.setThumbImage(#imageLiteral(resourceName: "SliderThumb-Highlighted"), for: .highlighted)
//        slider.setThumbImage()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var mainBtn: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    var round: Int = 0
    var goal: Int = 0
    
    func refreshScore(){
        score = 0
        round = 0
        goal = Int(arc4random_uniform(100) + 1)
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
        goalLabel.text = "\(goal)"
    }
    func nextRound() {
        goal = Int(arc4random_uniform(100) + 1)
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
        goalLabel.text = "\(goal)"
    }
    @IBAction func resetValue(_ sender: Any) {
        refreshScore()
    }
    
    
    @IBAction func checkValue(_ sender: Any) {
        var alert : AnyObject
        let value = Int(slider.value)
        let goal = self.goal
        var score = 0
        print(value)
        print(goal)
        
        if(value == goal){
            score = 100
            alert = UIAlertController(title: "You Had it!", message: "You scored \(score) points.", preferredStyle: UIAlertControllerStyle.alert)
            self.score += score
        } else {
            
            if(value > goal){
                score = (100 - (value - goal))
            } else {
                score = (100 - (goal - value))
            }
            alert = UIAlertController(title: "You almost Had it!", message: "You scored \(score) points.", preferredStyle: UIAlertControllerStyle.alert)
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
            self.round += 1
            self.score += score
            self.nextRound()
        }))
        
        present(alert as! UIViewController, animated: true, completion: nil)
    }

}

