//
//  ActionLoginSignupViewController.swift
//  MartVenue
//
//  Created by Shuvo on 8/11/20.
//

import UIKit

class ActionLoginSignupViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    var navTitle: String = "No Title"
    let tabHomeNavId = "segue_id_tabbar_home"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = navTitle
        if(navTitle == "Login") {
            loginButton.isHidden = false
        }
        else {
            loginButton.isHidden = true
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginSignupAction(_ sender: Any) {
        if(navTitle == "Login") {
            self.performSegue(withIdentifier: tabHomeNavId, sender: self)
        }
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
