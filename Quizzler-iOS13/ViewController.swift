//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

struct Question {
    var text: String
    var answer: String
    
    init(text: String, answer: String) {
        self.text = text
        self.answer = answer
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        Question(text: "Four + Two is equal to Six.", answer: "True"),
        Question(text: "Five - Three is greater than One.", answer: "True"),
        Question(text: "Three + Eight is less than Ten.", answer: "False")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    func updateUI(){
        questionNumber = questionNumber % quiz.count
        if questionNumber < quiz.count {
            questionLabel.text = quiz[questionNumber].text
        }
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        questionNumber += 1
        updateUI()
    }
    
    
}

