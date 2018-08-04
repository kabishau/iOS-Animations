//
//  MillionDollarViewController.swift
//  iOS-Animations
//
//  Created by Barney on 07/02/2018.
//  Copyright © 2018 Barney. All rights reserved.
//www.twilio.com/blog/2018/04/constraint-animations-ios-apps-xcode-swift.html

import UIKit

class MillionDollarViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var millionDollarLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // constraints
    @IBOutlet weak var labelConstraint: NSLayoutConstraint!
    @IBOutlet weak var emailTextFieldConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordTextFieldConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginButtonCenterConstraint: NSLayoutConstraint!
    
    
    @IBAction func loginButton(_ sender: Any) {
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelConstraint.constant -= view.bounds.width
        emailTextFieldConstraint.constant -= view.bounds.width
        passwordTextFieldConstraint.constant -= view.bounds.width
        loginButtonCenterConstraint.constant -= view.bounds.width
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0,
                                delay: 0.0,
                                options: [.curveEaseOut],
                                animations: {
                                    self.labelConstraint.constant += self.view.bounds.width
                                    self.view.layoutIfNeeded()
                                }, completion: nil)
        UIView.animate(withDuration: 1.0,
                       delay: 0.3,
                       options: [.curveEaseOut],
                       animations: {
                        self.emailTextFieldConstraint.constant += self.view.bounds.width
                        self.view.layoutIfNeeded()
        }, completion: nil)
        UIView.animate(withDuration: 1.0,
                       delay: 0.6,
                       options: [.curveEaseOut],
                       animations: {
                        self.passwordTextFieldConstraint.constant += self.view.bounds.width
                        self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0,
                       delay: 1.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 10,
                       options: [],
                       animations: {
            self.loginButtonCenterConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }
}

