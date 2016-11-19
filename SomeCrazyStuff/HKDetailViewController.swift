//
//  HKDetailViewController.swift
//  SomeCrazyStuff
//
//  Created by Di Wang on 2016/11/19.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit
import PopupDialog

class HKDetailViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var hackathon: UILabel!
    @IBOutlet weak var descImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var descPhoto: UIImageView!
    //How to get datas for pickerDataSource?
    var pickerDataSource = ["Team_1","Team_2","Team_3"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        
        descImage.image = UIImage(named: "defaultImg")
        /////
        ///
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        ///
        /////
    }
    
    
    @IBAction func btn_chat(_ sender: UIButton) {
        showStandardDialog()
    }
    
    func showStandardDialog() {
        
        // Prepare the popup
        let title = "Star group chat?"
        let message = "Group chat allows you to meet your groupmates even before hackathon begins. Click Start and let's begin!"
        
        // Create the dialog
        let popup = PopupDialog(title: title, message: message, buttonAlignment: .horizontal, transitionStyle: .zoomIn, gestureDismissal: true) {
            print("Completed")
        }
        
        // Create first button
        let buttonOne = CancelButton(title: "CANCEL") {
            
        }
        
        // Create second button
        let buttonTwo = DefaultButton(title: "Start!") {
            self.performSegue(withIdentifier: "identifier_3", sender: self)
        }
        
        // Add buttons to dialog
        popup.addButtons([buttonOne, buttonTwo])
        
        // Present dialog
        self.present(popup, animated: true, completion: nil)
    }

}

extension HKDetailViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.view.backgroundColor = UIColor.white
        }
        else if(row == 1)
        {
            self.view.backgroundColor = UIColor.red
        }
        else if(row == 2)
        {
            self.view.backgroundColor =  UIColor.green
        }
        else
        {
            self.view.backgroundColor = UIColor.blue
        }
    }
}
