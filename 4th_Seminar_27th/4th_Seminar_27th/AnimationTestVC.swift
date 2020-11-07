//
//  AnimationTestVC.swift
//  4th_Seminar_27th
//
//  Created by 황지은 on 2020/11/07.
//

import UIKit

class AnimationTestVC: UIViewController {

    @IBOutlet var jjangguImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(jjangguImg.frame)

        // Do any additional setup after loading the view.
    }
    
    func initPosition(){
        jjangguImg.frame = CGRect(x: 50, y: 300, width: 300, height: 300)
    }
    
    @IBAction func animationStart(_ sender: Any) {
        
        //애니메이션 코드 블럭
        UIView.animate(withDuration: 3.0, animations: {
            self.jjangguImg.alpha = 0
            self.jjangguImg.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        }){
            //애니메이션이 끝나고 실행될 코드 블럭
            finished in
            self.jjangguImg.alpha = 1
            self.initPosition()
        }
        
        
        
        UIView.animate(withDuration: 2.0, animations: {
            //CGAffineTransform은 현재 위치를 기반으로 작동함
            
            //scaleX : 현재 너비의 x배를 곱하겠다
            self.jjangguImg.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
            
            self.jjangguImg.transform = CGAffineTransform(rotationAngle: .pi / 2)
        })
        
        
        //MARK : concatenating으로 한번에 묶어서 처리하는 방법
        let scale = CGAffineTransform(scaleX: 2.0, y: 2.0)
        let rotate = CGAffineTransform(rotationAngle: .pi / 4)
        let move = CGAffineTransform(translationX: 200, y: 200)
        let combine = scale.concatenating(move).concatenating(rotate)
        
        UIView.animate(withDuration: 1.0, delay: 0) {
        self.jjangguImg.transform = combine }
    }
}
