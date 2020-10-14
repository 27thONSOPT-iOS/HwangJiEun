//
//  ViewController.swift
//  1st_Assignment_27th
//
//  Created by 황지은 on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var partLabel: UILabel!
    @IBOutlet var sayHelloLabel: UILabel!
    var part:String?
    var getName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let part = self.part else {return}
        guard let getName = self.getName else {return}

        print(part)
        print(getName)
        self.partLabel.text =  part
        self.sayHelloLabel.text = "\(getName)님 안녕하세요~^^"
            
    }
    

    @IBAction func goToLoginVC(_ sender: UIButton) {
        guard let naviVC = storyboard?.instantiateViewController(identifier: "NavigationController") else {return}
        naviVC.modalPresentationStyle = .fullScreen
        
        self.present(naviVC, animated: true, completion: nil)
    }
    

    

    
}

