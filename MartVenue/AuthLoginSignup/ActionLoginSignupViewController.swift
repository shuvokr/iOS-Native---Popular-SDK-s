//
//  ActionLoginSignupViewController.swift
//  MartVenue
//
//  Created by Shuvo on 8/11/20.
//

import UIKit

class ActionLoginSignupViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var fullNameView: UIView!
    @IBOutlet weak var emailAddressView: UIView!
    @IBOutlet weak var phoneNoView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    
    var navTitle: String = "No Title"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = navTitle
        setupView()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
    }
    @IBAction func loginAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ActionLoginSignupViewController {
    func setupView() {
        
        fullNameView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        emailAddressView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        phoneNoView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        passwordView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        
        loginView.layer.borderColor = UIColor(red: 1, green: 0.394, blue: 0.308, alpha: 1).cgColor
        signUpView.layer.borderColor = UIColor(red: 1, green: 0.394, blue: 0.308, alpha: 1).cgColor
    }
}

/*
 Client ID
 120220857451-eio4thimi47cdmuumir56i11lp817i64.apps.googleusercontent.com
 iOS URL scheme
 com.googleusercontent.apps.120220857451-eio4thimi47cdmuumir56i11lp817i64
 */
