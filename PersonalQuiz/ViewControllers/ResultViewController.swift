//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit



class ResultViewController: UIViewController {
    
    var controlAnswers: [Answer]!
    
    @IBOutlet var resultOutlet: UILabel!
    @IBOutlet var describeAnswer: UILabel!
    
    override func viewDidLoad() {
        navigationItem.hidesBackButton = true
        super.viewDidLoad()
        
        func makeResultDicision(answers: [Answer]) {

            var result: [Animal: Int]! = [
                Animal.dog: 0,
                Animal.cat: 0,
                Animal.rabbit:0,
                Animal.turtle: 0
            ]
            
            for controlAnswer in controlAnswers {
                switch controlAnswer.animal {
                case .dog:
                    result[Animal.dog]! += 1
                case .cat:
                    result[Animal.cat]! += 1
                case .rabbit:
                    result[Animal.rabbit]! += 1
                case .turtle:
                    result[Animal.turtle]! += 1
                }
            }
            
            let sortedValues = result.sorted { $0.1 < $1.1 }
            
            if sortedValues.last!.key == Animal.dog{
                resultOutlet.text = String(Animal.dog.rawValue)
                describeAnswer.text = Animal.dog.definition
            } else if sortedValues.last!.key == Animal.cat{
                resultOutlet.text = String(Animal.cat.rawValue)
                describeAnswer.text = Animal.cat.definition
            } else if sortedValues.last!.key == Animal.rabbit {
                resultOutlet.text = String(Animal.rabbit.rawValue)
                describeAnswer.text = Animal.rabbit.definition
            } else if sortedValues.last!.key == Animal.turtle {
                resultOutlet.text = String(Animal.turtle.rawValue)
                describeAnswer.text = Animal.turtle.definition
            }
        }
        makeResultDicision(answers: controlAnswers)
    }
               
    @IBAction func doneBarButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

