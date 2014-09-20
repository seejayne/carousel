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

    @IBOutlet weak var scrollView: UIScrollView!
   
    @IBOutlet weak var signInButtonView: UIView!


    // Sign In Button
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
                alertView.dismissWithClickedButtonIndex(0, animated: true)
            }else if(self.passwordTextField.text == ""){
                UIAlertView(title: "Password required", message: "Please enter your password", delegate: nil, cancelButtonTitle: "Ok").show()
                alertView.dismissWithClickedButtonIndex(0, animated: true)
            }else{
                UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: nil, cancelButtonTitle: "Try again").show()
                alertView.dismissWithClickedButtonIndex(0, animated: true)
            }
        })
        
        
    }
 
    // Initialize
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 500)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    
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
    
    // keyboard functions
    func keyboardWillShow(notification: NSNotification!) {
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification. Is this useful?
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        
        // Animate stuff
        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            // Move that scrollView
            //self.scrollView.contentOffset.y = kbSize.height
            //self.scrollView.setContentOffset(CGPoint(x: 0, y: (kbSize.height)-10), animated: true)
            
            //self.scrollView.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
            
            self.scrollView.contentOffset.y = 150
            self.signInButtonView.center.y = 325
            }, completion: nil)
        
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        
        
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.15, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            
            // move that scroll view!
            self.scrollView.contentOffset.y = 0
            
            self.signInButtonView.center.y = 415
            }, completion: nil)

        
        
    }
    
    // useless memory function?
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

}
