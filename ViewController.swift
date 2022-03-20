//
//  ViewController.swift
//  Project2
//
//  Created by Ильяс Кудайбергенов on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    


    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestionsAnswered = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 2
        button3.layer.borderWidth = 3
        
        button1.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        button2.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        button3.layer.borderColor = UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(tapped))
        
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        askQuestion()
        // Do any additional setup after loading the view.
    }
    
    
    func askQuestion(action:  UIAlertAction! = nil) {
        correctAnswer = Int.random(in: 0...2)
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        //title = countries[correctAnswer].uppercased() + "                                     Your score is " + String(score)
        title = countries[correctAnswer].uppercased()
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score+=1
            numberOfQuestionsAnswered+=1
        } else {
            title = "Wrong"
            score -= 1
            numberOfQuestionsAnswered+=1
        }
        if numberOfQuestionsAnswered == 10 {
            let endOfTheGame = UIAlertController(title: "Your score is \(score)", message: nil, preferredStyle: .alert)
            
            present(endOfTheGame, animated: true)
            numberOfQuestionsAnswered = 0
            score = 0
        } else {
            if title == "Correct" {
                let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            } else {
                let ac = UIAlertController(title: title, message: """
That's the flag of \(countries[sender.tag].uppercased()).
Your score is \(score)
""", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            }
          
        }
    }
    @objc func tapped() {
        let showScoreWithAlert = UIAlertController(title: "Score", message: nil, preferredStyle: .actionSheet)
        showScoreWithAlert.addAction(UIAlertAction(title: "Your current score is \(score)", style: .default, handler: nil))
        present(showScoreWithAlert, animated: true)
    }
    
}

