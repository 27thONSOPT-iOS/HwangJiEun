//
//  SignupVC.swift
//  6th_Assignment_27th
//
//  Created by 황지은 on 2020/11/26.
//

import UIKit

class SignupVC: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func simpleSuccessAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default){_ in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func simpleErrAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func touchUpSignUp(_ sender: UIButton) {
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let nickname = nicknameTextField.text else {return}
        
        AuthService.shared.signUp(email: email, password: password, userName: nickname, completion: { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let data):
                if let signupData = data as? SignupData { self.simpleSuccessAlert(title: "회원가입 성공", message:
                                                                            "\(signupData.userName)님 회원가입 성공!")
                    UserDefaults.standard.set(signupData.userName, forKey: "userName")
                }
                
            case .requestErr(let msg):
                if let message = msg as? String {
                    self.simpleErrAlert(title: "로그인 실패", message: message)
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
