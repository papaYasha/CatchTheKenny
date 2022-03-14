//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Macbook on 14.03.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var kennyImage = UIImageView()
    var timeCounter = 30
    var score = 0
    var highScore = 0
    var timer = Timer()
    let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))

    
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
        kennyImage.image = UIImage(named: "kenny")
        kennyImage.frame.size = CGSize(width: 70, height: 100)
        kennyImage.frame = CGRect(
            x: containView.center.x - 35,
            y: containView.center.y - 50,
            width: kennyImage.frame.width,
            height: kennyImage.frame.height)
        containView.addSubview(kennyImage)
        kennyImage.isUserInteractionEnabled = true
        kennyImage.addGestureRecognizer(recognizer)
    }
    
    func animateImage() {
//        if kennyImage.center.x >= containView.frame.minX + 50 && kennyImage.center.x <= containView.frame.maxX - 50 && kennyImage.center.y >= containView.frame.minY + 50 && kennyImage.center.y <= containView.frame.maxY - 50 {
        UIView.animate(withDuration: 0.1) {
            self.kennyImage.frame = CGRect(
                x: .random(in: self.containView.frame.minX + 20...self.containView.frame.maxX - 100),
                y: .random(in: self.containView.frame.minY + 50...self.containView.frame.maxY - 100),
                width: self.kennyImage.frame.width,
                height: self.kennyImage.frame.height)
        }
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
        animateImage()
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
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
}

