//
//  ResultViewController.swift
//  1st_Seminar_27th
//
//  Created by 황지은 on 2020/10/10.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var updateStateLabel: UILabel!
    @IBOutlet var updateIntervalLabel: UILabel!
    
    var email:String?
    var isAutoUpdated:Bool?
    var updateInterval:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        // Do any additional setup after loading the view.
    }
    
    func setLabel(){
        if let email = self.email,
           let isAutoUpdate = self.isAutoUpdated,
           let updateInterval = self.updateInterval {
            self.emailLabel.text = email
            self.emailLabel.sizeToFit()
            
            self.updateStateLabel.text = isAutoUpdate ? "자동갱신" : "수동갱신"
            self.updateStateLabel.sizeToFit()
            self.updateIntervalLabel.text = "\(updateInterval)분"
            
        }
        
      
    }
    
    @IBAction func touchUpBackBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
