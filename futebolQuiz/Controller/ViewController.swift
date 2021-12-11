//
//  ViewController.swift
//  futebolQuiz
//
//  Created by Bruno Lopes on 10/12/21.
//

import UIKit

class ViewController: UIViewController {

    var quizBrain = QuizBrain()
       
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
                
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)   
        
        let number = quizBrain.goToResults()
        if number == 11 {
            self.performSegue(withIdentifier: "goToResult", sender: self)
            quizBrain.resetApp()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.score = quizBrain.getFinalScore()
        }
    }
    
    
    @objc func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAswers()
        answerOneButton.setTitle(answerChoices[0], for: .normal)
        answerTwoButton.setTitle(answerChoices[1], for: .normal)
        answerThreeButton.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.updateProgressBar()
        scoreLabel.text = ("Gols: \(quizBrain.getScore())")
        
        answerOneButton.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 0.5)
        answerTwoButton.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 0.5)
        answerThreeButton.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.8431372549, blue: 0.2941176471, alpha: 0.5)
        
        
        
    }
    
    
}

