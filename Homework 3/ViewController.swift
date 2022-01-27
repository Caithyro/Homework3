//
//  ViewController.swift
//  Homework 3
//
//  Created by Дмитрий Куприенко on 05.12.2021.
//

import UIKit

class TaskOne_FirstViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        greenView.layer.cornerRadius = 100
    }
    
    
}

class TaskOne_SecondViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.layer.cornerRadius = 100
        centerView.layer.cornerRadius = 100
        bottomView.layer.cornerRadius = 100
    }
    
    
}

class TaskOne_ThirdViewController: UIViewController {
    
    
    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var centralYellowView: UIView!
    @IBOutlet weak var bottomLeftView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topRightView.layer.cornerRadius = 100
        centralYellowView.layer.cornerRadius = 100
        centralYellowView.alpha = 0.7
        bottomLeftView.layer.cornerRadius = 100
        
    }
}

class TaskOne_FourthViewController: UIViewController {
    
    @IBOutlet weak var invisibleView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        invisibleView.layer.cornerRadius = 195
        invisibleView.clipsToBounds = true
        redView.layer.cornerRadius = 125
        yellowView.layer.cornerRadius = 125
        greenView.layer.cornerRadius = 125
        blueView.layer.cornerRadius = 125
        
    }
}

class TaskTwoViewController: UIViewController {
    
    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var ballBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.layer.cornerRadius = 100
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 5, options: [.autoreverse, .repeat]) {
            self.ballBottomConstraint.constant = 300
            self.view.layoutIfNeeded()
        }
        
    }
    
    
}

class TaskThree_ViewController:UIViewController {
    
    @IBOutlet weak var runnerView: UIView!
    @IBOutlet weak var runnerViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var runnerViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var runnerBottomconstraint: NSLayoutConstraint!
    @IBOutlet weak var runnerRightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        runnerView.layer.cornerRadius = 50
    }
    
    @IBAction func runButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0) {
            self.runnerViewLeftConstraint.priority = UILayoutPriority(rawValue: 999)
            self.runnerRightConstraint.priority = UILayoutPriority(1000)
            self.runnerRightConstraint.constant = 0
            
            self.view.layoutIfNeeded()
        } completion: { (finished: Bool) in
            goDown()
            goLeft()
            goUp()
        }
        
        func goDown(){
            UIView.animate(withDuration: 1, delay: 0) {
                self.runnerViewTopConstraint.priority = UILayoutPriority(999)
                self.runnerBottomconstraint.priority = UILayoutPriority(1000)
                self.runnerBottomconstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
        
        func goLeft(){
            UIView.animate(withDuration: 1, delay: 1) {
                self.runnerRightConstraint.priority = UILayoutPriority(999)
                self.runnerViewLeftConstraint.priority = UILayoutPriority(1000)
                self.runnerViewLeftConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
        
        func goUp(){
            UIView.animate(withDuration: 1, delay: 2) {
                self.runnerBottomconstraint.priority = UILayoutPriority(999)
                self.runnerViewTopConstraint.priority = UILayoutPriority(1000)
                self.runnerViewTopConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
}

class TaskFour_ViewController:UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let monthsData = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    let numbersData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TaskFour_ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        monthsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = monthsData[indexPath.row]
        
        return cell
        
    }
}

extension TaskFour_ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let month = monthsData[indexPath.row]
        let number = numbersData[indexPath.row]
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        if let extraViewController = main.instantiateViewController(withIdentifier: "ExtraViewController") as? ExtraViewController{
            extraViewController.month = month
            extraViewController.number = number
            navigationController?.pushViewController(extraViewController, animated: true)
        }
    }
}

