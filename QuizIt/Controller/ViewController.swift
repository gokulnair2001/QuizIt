//
//  ViewController.swift
//  QuizIt
//
//  Created by Gokul Nair on 02/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
  
    var quizBrain = QuizBrain()
   
    let maxtime:Float = 60.0
    var currentTime:Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       updateUI()
        
        timerBar.setProgress(currentTime, animated: true)
        perform(#selector(startTimer), with: nil, afterDelay: 1.0)
        
        choice1.layer.cornerRadius = 20
        choice2.layer.cornerRadius = 20
        choice3.layer.cornerRadius = 20
        choice4.layer.cornerRadius = 20
        
        scoreLabel.layer.cornerRadius = 10
        
        scoreLabel.layer.borderColor = #colorLiteral(red: 1, green: 0.7909796834, blue: 0, alpha: 1)
        scoreLabel.layer.borderWidth = 1
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
       let userGotItRight =  quizBrain.checkAnswer(answer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            //score += 1
        }else{
            sender.backgroundColor = UIColor.red
        }
    
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    

    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestion()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        let option = quizBrain.getOptions()
        
        choice1.setTitle(option[0], for: .normal)
        choice2.setTitle(option[1], for: .normal)
        choice3.setTitle(option[2], for: .normal)
        choice4.setTitle(option[3], for: .normal)
        
        choice1.backgroundColor = UIColor.systemYellow
        choice2.backgroundColor = UIColor.systemYellow
        choice3.backgroundColor = UIColor.systemYellow
        choice4.backgroundColor = UIColor.systemYellow
        
        progressBar.setProgress(quizBrain.getProgress(), animated: true)
        
        let completed = quizBrain.checkTestCompletion()
        
        if completed {
            self.performSegue(withIdentifier: "done", sender: nil)
        }else{
            print("continue")
        }
    }
}


extension ViewController{
    @objc func startTimer() {
       
        currentTime += 1
        timerBar.progress = currentTime/maxtime
        timeLabel.text = String(currentTime)
        
        if currentTime < maxtime {
            perform(#selector(startTimer), with: nil, afterDelay: 1.0)
        }else{
            self.performSegue(withIdentifier: "done", sender: nil)
            currentTime = 0.0
        }
    }
}
