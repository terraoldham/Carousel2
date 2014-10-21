//
//  CreateViewController.swift
//  Carousel2
//
//  Created by Terra Oldham on 10/19/14.
//  Copyright (c) 2014 HearsaySocial. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var viewView: UIView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func createButton(sender: AnyObject) {
        checkCreate()
    }
   @IBAction func onAcceptButton(sender: AnyObject) {
        createButton.selected = true
    }
    
    func checkCreate() {
        if emailField.text.isEmpty || firstField.text.isEmpty || lastField.text.isEmpty || passwordField.text.isEmpty {
            var createAlertView = UIAlertView(title: "Enter Fields", message: "Please enter your name, email, and password.", delegate: nil, cancelButtonTitle: "OK")
            createAlertView.show()
        } else if createButton.selected == false {
            var termsAlert = UIAlertView(title: "Terms of Use", message: "Please accept the Terms of Use before creating an account.", delegate: nil, cancelButtonTitle: "OK")
            termsAlert.show()
        } else {
            var createAlert = UIAlertView(title: "Creating Account", message: nil, delegate: nil, cancelButtonTitle: nil)
            delay(2){
                createAlert.dismissWithClickedButtonIndex(0, animated: true)}
            createAlert.show()
            performSegueWithIdentifier("create segue", sender: self)
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        viewView.transform = CGAffineTransformMakeTranslation(0, -150)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        viewView.transform = CGAffineTransformMakeTranslation(0, 0)
    }

}
