//
//  LoginSignUpViewController.swift
//  MartVenue
//
//  Created by Shuvo on 8/11/20.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit
import AuthenticationServices

class LoginSignUpViewController: UIViewController {
    
    @IBOutlet weak var signInButtonStack: UIStackView!
    
    @IBOutlet weak var userIdView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signupView: UIView!
    
    @IBOutlet weak var appleSignInButtonView: UIView!
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
        setUpSignInAppleButton()
        
        // Observe access token changes
        // This will trigger after successfully login / logout
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            // Print out access token
            print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
        }
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

// Apple sign in
extension LoginSignUpViewController: ASAuthorizationControllerDelegate {
    func setUpSignInAppleButton() {
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.addTarget(self, action: #selector(handleAppleIdRequest), for: .touchUpInside)
        
        authorizationButton.frame = appleSignInButtonView.frame
        
        appleSignInButtonView.addSubview(authorizationButton)
        
    }
    
    @objc func handleAppleIdRequest() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        
//        appleIDProvider.getCredentialState(forUserID: userID) {  (credentialState, error) in
//             switch credentialState {
//                case .authorized:
//                    print("Apple id: Authorized")
//                    break
//                case .revoked:
//                    print("Apple id: revoked")
//                    break
//                case .notFound:
//                    print("Apple id: not Found")
//                default:
//                    break
//             }
//        }
        
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    // ASAuthorizationControllerDelegate delegets
    
    // apple signin successfull
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("User id is \(userIdentifier) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))")
        }
    }
    
    // apple sign in found error
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error)
    }
    
}
