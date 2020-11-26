//
//  ViewController.swift
//  6th_Assignment_27th
//
//  Created by 황지은 on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    @IBAction func touchUpLoginBtn(_ sender: UIButton) {
        
        guard let loginEmail = emailTextField.text,
              let loginPw = passwordTextField.text else {return}
        
        
        AuthService.shared.signIn(email: loginEmail, password: loginPw, completion: { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let signInData = data as? SignInData { self.simpleAlert(title: "로그인 성공", message:
                                                                            "\(signInData.userName)님 로그인 성공!")
                    UserDefaults.standard.set(signInData.userName, forKey: "userName")
                }
                
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleAlert(title: "로그인 실패", message: message)
                }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
            
        })
    }
    
    @IBAction func goToSignupVC(_ sender: UIButton) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SignupVC") as? SignupVC else {
            return
        }
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
}

