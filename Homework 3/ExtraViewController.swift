//
//  ExtraViewController.swift
//  Homework 3
//
//  Created by Дмитрий Куприенко on 06.12.2021.
//

import UIKit

class ExtraViewController: UIViewController {
    
    var month = ""
    var number = ""
    
    @IBOutlet weak var monthNameLabel: UILabel!
    @IBOutlet weak var monthNumberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        monthNameLabel.text = month
        monthNumberLabel.text = number
        
    }

}
