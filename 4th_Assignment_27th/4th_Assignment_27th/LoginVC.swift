//
//  LoginVC.swift
//  1st_Assignment_27th
//
//  Created by 황지은 on 2020/10/14.
//

import UIKit

class LoginVC: UIViewController,UITextFieldDelegate {

    @IBOutlet var partTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        partTextField.delegate = self
        nameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
       
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(_ sender:Notification){
        self.view.frame.origin.y = -150
    }
        
    @objc func keyboardWillHide(_ sender:Notification){
        self.view.frame.origin.y = 0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.partTextField {
            textField.resignFirstResponder()
            self.partTextField.becomeFirstResponder()
        }
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func touchUpToMain(_ sender: Any) {
        
        guard let MainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as? MainVC else {
            print("hihi...?")
            return}
        
        MainVC.part = self.partTextField.text
        MainVC.getName = self.nameTextField.text
        
        
        self.navigationController?.popToRootViewController(animated: true)
     
    }
    

    
    //    @IBAction func goToSignupVC(_ sender: UIButton) {
//        guard let signupVC = storyboard?.instantiateViewController(identifier: "SignupVC") else {return}
//
//        self.navigationController?.pushViewController(signupVC, animated: true)
//    }
//
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  

}
