//
//  ViewController.swift
//  memorizingcalculator
//
//  Created by Nehemiah Igbadumhe-Odior on 11/15/16.
//  Copyright © 2016 niidmogames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var answer = 0
    var numbers: [Int] = []
    var segueIdentifier = "segue"
    var calc = Calculator(state: .nuteral)
    var computations: [PreviousComputations] = []
    
    @IBOutlet weak var calculatorScreenViewLabel: UILabel!
    @IBOutlet weak var computedResultsLabel: UILabel!
    @IBOutlet weak var COMPIUTEDLABEL: UILabel!
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        calculatorScreenViewLabel.text = calculatorScreenViewLabel.text! + String(sender.tag)
    }
    
    @IBAction func calculateButton(_ sender: AnyObject) {
        numbers.append(Int(calculatorScreenViewLabel.text!)!)
        var state = Calculator.CalculatorFunctions.add.rawValue
        switch calc.state {
        case .adding:
            state = Calculator.CalculatorFunctions.add.rawValue
            answer = calc.add(a: numbers[0], b: numbers[1])
            calculatorScreenViewLabel.text = String(answer)
        case .subtracting:
            state = Calculator.CalculatorFunctions.subtract.rawValue
            answer = calc.subtract(a: numbers[0], b: numbers[1])
            calculatorScreenViewLabel.text = String(answer)
        case .nuteral:
            answer = 0
        default:
            break
        }
        
        let previouscomp = PreviousComputations(operation: state, a: numbers[0], b: numbers[1], answer:String(answer))
        addComputaion(computation: previouscomp)
        computedResultsLabel.text = calc.returnComputedResults(computations:computations)
        numbers = []
    }
    
    @IBAction func operationButtonPressed(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
            numbers.append(Int(calculatorScreenViewLabel.text!)!)
            calculatorScreenViewLabel.text = calc.clear()
            print(numbers)
            calc.state = .adding
        case 1:
            numbers.append(Int(calculatorScreenViewLabel.text!)!)
            calculatorScreenViewLabel.text = calc.clear()
            print(numbers)
            calc.state = .subtracting
        case 2:
            numbers = []
            calculatorScreenViewLabel.text = calc.clear()
            print(numbers)
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorScreenViewLabel.text = calc.clear()
        computedResultsLabel.text = calc.returnComputedResults(computations:computations)
    }
    
    func addComputaion(computation:PreviousComputations){
        computations.append(computation)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destination = segue.destination as! PreviousComputationsCollectionViewController
            destination.viewController = self
        }
    }
}

