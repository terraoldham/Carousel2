//
//  SignInViewController.swift
//  Carousel2
//
//  Created by Terra Oldham on 10/19/14.
//  Copyright (c) 2014 HearsaySocial. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var loginActivity: UIActivityIndicatorView!
    @IBAction func signinButton(sender: AnyObject) {
        self.loginActivity.startAnimating()
        var loginAlert = UIAlertView(title: "Logging In", message: nil, delegate: nil, cancelButtonTitle: nil)
        loginAlert.show()
        delay(2){
            loginAlert.dismissWithClickedButtonIndex(0, animated: true)
            self.checkFields()
            self.loginActivity.stopAnimating()
            }
        }
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func onTap(sender: AnyObject) {view.endEditing(true)
    }
    @IBAction func backButton(sender: AnyObject) {navigationController?.popToRootViewControllerAnimated(false)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkFields() {
        if self.emailField.text == "email" && self.passwordField.text == "password" {
            self.performSegueWithIdentifier("signin", sender: self)
        } else if self.emailField.text == "" && self.passwordField.text == "" {
            var alertViewBlank = UIAlertView(title: "Blank Fields", message: "Please enter the correct credentials.", delegate: nil, cancelButtonTitle: "OK")
            alertViewBlank.show()
        } else {
            var alertView = UIAlertView(title: "Sign In Error", message: "Please enter the correct credentials.", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
