//
//  SideMenuViewController.swift
//  MartVenue
//
//  Created by Shuvo on 8/11/20.
//

import UIKit

class SideMenuViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    deinit {
        print("deinit -> class SideMenuViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("override func viewDidLoad()")
        // Do any additional setup after loading the view.
        setUpView()
    }
    
    func setUpView() {
//        nameLabel.text = "\(UserDefaults.standard.string(forKey: "name")!) (\(UserDefaults.standard.string(forKey: "uName")!))"
//        userIdLabel.text = "User ID: \(UserDefaults.standard.string(forKey: "uId")!)"
    }

    @IBAction func exitButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
