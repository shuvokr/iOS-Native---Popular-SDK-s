//
//  LoginSignUpViewController.swift
//  MartVenue
//
//  Created by Shuvo on 8/11/20.
//  https://swiftsenpai.com/development/facebook-login-integration-in-swift/

import UIKit
import GoogleSignIn

class LoginSignUpViewController: UIViewController {
    
    @IBOutlet weak var userIdView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signupView: UIView!
    
    @IBOutlet weak var signInButtonGoogle: UIButton!
    
    
    struct AuthInfo {
        var userId: String?
        var password: String?
    }
    private var authInfo : AuthInfo = AuthInfo(userId: nil, password: nil)
    
    let tabHomeNavId = "segue_id_tabbar_home1"
    let idForActionLoginSignUp = "segue_id_action_login_signup"
    var loginOrSignupFlag : Bool = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupGoogleLoginButton()
    }
    
    func setupView() {
        userIdView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        passwordView.layer.borderColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        loginView.layer.borderColor = UIColor(red: 1, green: 0.394, blue: 0.308, alpha: 1).cgColor
        signupView.layer.borderColor = UIColor(red: 1, green: 0.394, blue: 0.308, alpha: 1).cgColor
    }
    @IBAction func actionPhoneNoTextField(_ sender: UITextField) {
        authInfo.userId = sender.text
    }
    
    @IBAction func actionPasswordTextField(_ sender: UITextField) {
        authInfo.password = sender.text
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        print(authInfo)
        loginOrSignupFlag = true // true for login request
        self.performSegue(withIdentifier: tabHomeNavId, sender: self)
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
            
            vc.navTitle = loginOrSignupFlag ? "LOGIN" : "SIGN UP"
        }
    }

}

extension LoginSignUpViewController {
    func setupGoogleLoginButton() {
        // Add sign in button
        
        signInButtonGoogle.layer.cornerRadius = 4.0
        signInButtonGoogle.setTitle("Sign in with Google", for: .normal)
        signInButtonGoogle.setTitleColor(.white, for: .normal)
        signInButtonGoogle.backgroundColor = .systemRed
        signInButtonGoogle.addTarget(self, action: #selector(googleSignInButtonTapped(_:)), for: .touchUpInside)
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
                
        // Register notification to update screen after user successfully signed in
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(userDidSignInGoogle(_:)),
                                               name: .signInGoogleCompleted,
                                               object: nil)
    }

    
    // MARK:- Button action
    @objc func googleSignInButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    // MARK:- Notification
    @objc private func userDidSignInGoogle(_ notification: Notification) {
        // Update screen after user successfully signed in
    }
}
