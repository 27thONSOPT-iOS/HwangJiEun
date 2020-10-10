//
//  ViewController.swift
//  1st_Seminar_27th
//
//  Created by 황지은 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpClick(_ sender: UIButton) {
        helloLabel.text = "Hello BoraBoraBong"
        
        // 텍스트의 사이즈에 맞게 fit됨
        helloLabel.sizeToFit()
    }
    
    @IBAction func presentModally(_ sender: UIButton) {
        
        guard let storyboard = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {return}

        self.present(storyboard, animated: true, completion: nil)
        
    }
    
    @IBAction func navigationShow(_ sender: UIButton) {
        
        guard let storyboard = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {return}

        self.navigationController?.pushViewController(storyboard, animated: true)
       
        
    }
    
}

