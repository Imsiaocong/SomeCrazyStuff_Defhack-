//
//  ViewController.swift
//  SomeCrazyStuff
//
//  Created by Di Wang on 2016/11/19.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit
import TextFieldEffects
import PopupDialog

class AuthenticationVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    var name: AnyObject!
    var passWord: AnyObject!
    
    fileprivate let segueName = "identifier_1"
    //var nameTextField: KaedeTextField!
    //var passwordTextField: KaedeTextField!
    
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        //let textField = KaedeTextField(frame: self.frame)
        //textField.placeholderColor = .darkGray
        //textField.foregroundColor = .lightGray
        //self.view.addSubview(textField)
    }

    @IBAction func auth(_ sender: UIButton) {
        self.userPassword.delegate = self
        self.userName.delegate = self
        
        self.name = userName.text as AnyObject!
        self.passWord = userPassword.text as AnyObject!
    }
    
    @IBAction func btn_clicked(_ sender: UIButton) {
        showStandardDialog()
    }
    
    func showStandardDialog() {
        
        // Prepare the popup
        let title = "Thank you for using WhatsRate?😊"
        let message = "Whats rate is an iOS widget for tracking currency and calculating a given cost. It only supports USD/CNY so far. Please give a like in App Store🙏🏻"
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true) {
            print("Completed")
        }
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL") {
            
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "OK") {
            
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }
}

/*
Log:
 1. Can't receive data from the url given.
 2. How to put images in an array.
 3. Having trouble with parsing certain data into ThirdVC.
 4. Overall, I have trouble with get the data from database!!
 */
