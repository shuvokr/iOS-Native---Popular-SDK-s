//
//  LoginSignUpViewController.swift
//  MartVenue
//
//  Created by Shuvo on 8/11/20.
//

import UIKit

class LoginSignUpViewController: UIViewController {
    
    @IBOutlet weak var userIdView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signupView: UIView!
    
    let idForActionLoginSignUp = "segue_id_action_login_signup"
    var loginOrSignupFlag : Bool = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        userIdView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        passwordView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        loginView.layer.borderColor = UIColor(red: 1, green: 0.394, blue: 0.308, alpha: 1).cgColor
        signupView.layer.borderColor = UIColor(red: 1, green: 0.394, blue: 0.308, alpha: 1).cgColor
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        loginOrSignupFlag = true // true for login request
        self.performSegue(withIdentifier: idForActionLoginSignUp, sender: self)
    }
    
    @IBAction func actionSignUp(_ sender: Any) {
        loginOrSignupFlag = false // false for signup request
        self.performSegue(withIdentifier: idForActionLoginSignUp, sender: self)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == idForActionLoginSignUp) {
            let nextVc = segue.destination as! UINavigationController
            let vc = nextVc.topViewController as! ActionLoginSignupViewController
            
            vc.navTitle = loginOrSignupFlag ? "Login" : "Sign Up"
        }
    }

}
