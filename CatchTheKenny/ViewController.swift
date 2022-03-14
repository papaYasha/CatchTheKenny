//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Macbook on 14.03.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var kennyImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var timeCounter = 30
    var score = 0
    var highScore = 0
    var timer = Timer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        configKennyImage()
        changeTimeLableValue()
    }
    
    func changeTimeLableValue() {
        timeLabel.text = "\(timeCounter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    func configKennyImage() {
        kennyImage.isUserInteractionEnabled = true
    }
    
    func animateImage() {
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time is over", message: "You score is: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Repeat", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func imagePressed(_ sender: UITapGestureRecognizer) {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown() {
        timeCounter -= 1
        timeLabel.text = String(timeCounter)
        if timeCounter == 0 {
            timer.invalidate()
            showAlert()
            score = 0
            scoreLabel.text = "Score: \(score)"
        }
    }
}

