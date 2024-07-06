//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by shilani on 04/07/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tip = String()
    var split = Int()
    var result = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = "Split between \(split) people, with \(tip) tip."

        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    
    
}
