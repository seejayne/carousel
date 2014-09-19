//
//  SignInViewController.swift
//  carousel
//
//  Created by Jayne Vidheecharoen on 9/18/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    // Sign in button stuff
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingActivityView: UIActivityIndicatorView!
    @IBAction func onSignInButton(sender: UIButton) {
        
        //loadingActivityView.startAnimating()
        var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle:  nil)
        
        alertView.show()
    
        // Fake network
        delay(2, closure: { () -> () in
            
            //self.loadingActivityView.stopAnimating()
            
            // all good
            if(self.emailTextField.text == "jayne@email.com") && (self.passwordTextField.text == "password"){
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                
                alertView.dismissWithClickedButtonIndex(0, animated: true)
                // go to next screen
                self.performSegueWithIdentifier("signinSegue", sender: self)
           
            // errors
            }else if(self.emailTextField.text == ""){
                UIAlertView(title: "Email required", message: "Please enter your email address", delegate: nil, cancelButtonTitle: "Ok").show()
            }else if(self.passwordTextField.text == ""){
                UIAlertView(title: "Password required", message: "Please enter your password", delegate: nil, cancelButtonTitle: "Ok").show()
            }else{
                UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "Try again").show()
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // Delay Function
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Back button
    @IBAction func onBackButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    // Dismiss Keyboard
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
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
