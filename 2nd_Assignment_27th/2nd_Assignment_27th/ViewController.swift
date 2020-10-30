//
//  ViewController.swift
//  2nd_Assignment_27th
//
//  Created by 황지은 on 2020/10/30.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var ScrollView: UIScrollView!
    @IBOutlet var floatingBtn: UIButton!
    @IBOutlet var bannerImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileBtn.layer.cornerRadius = 12.0
        floatingBtn.isHidden = true
        ScrollView.delegate = self
        
        
    }
    
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

            print(ScrollView.contentOffset.y)
            if ScrollView.contentOffset.y > bannerImg.bounds.size.height {
                floatingBtn.isHidden = false
                } else {
                    floatingBtn.isHidden = true
                }
        
    }
    @IBAction func floatingTouchUp(_ sender: UIButton) {
        ScrollView.setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    

}

