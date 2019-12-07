//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Frank Morales on 12/3/19.
//  Copyright © 2019 Frank Morales. All rights reserved.
//

import UIKit
import AppCenterCrashes
import AppCenterAnalytics

class ViewController: UIViewController {
    
    @IBOutlet weak var monthlyInvestmentsTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestRateTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if MSCrashes.hasCrashedInLastSession() {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error occurred.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        MSAnalytics.trackEvent("navigated_to_calculator")

    }

    @IBAction func calculateButton_TouchUpInside(_ sender: Any) {
//        MSCrashes.generateTestCrash()
        let current_age = Int(ageTextField.text!)
        let planned_retirement_age = Int(retirementAgeTextField.text!)
        let properties = ["current_age": String(current_age!),
                          "planned_retirement_age": String(planned_retirement_age!) ]
        
        
        MSAnalytics.trackEvent("calculate_retirement_amount", withProperties: properties)
    }


}

