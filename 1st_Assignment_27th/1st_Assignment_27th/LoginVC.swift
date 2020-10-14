//
//  LoginVC.swift
//  1st_Assignment_27th
//
//  Created by 황지은 on 2020/10/14.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var partTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpLoginBtn(_ sender: UIButton) {
        
        guard let MainVC = self.presentingViewController as? ViewController else {return}
        
        MainVC.part = self.partTextField.text
        MainVC.getName = self.nameTextField.text
        
        self.dismiss(animated: true, completion: nil)
       
    }
    
    @IBAction func goToSignupVC(_ sender: UIButton) {
        guard let signupVC = storyboard?.instantiateViewController(identifier: "SignupVC") else {return}
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  

}
