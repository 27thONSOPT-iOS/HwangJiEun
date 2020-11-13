//
//  ViewController.swift
//  2nd_Assignment_27th
//
//  Created by 황지은 on 2020/10/30.
//

import UIKit

class ProfileVC: UIViewController,UIScrollViewDelegate{
    
    @IBOutlet var profileBtn: UIButton!
    @IBOutlet var bannerImg: UIImageView!
    @IBOutlet var profileCV: UICollectionView!
    private var profileArray:[ProfileData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileBtn.layer.cornerRadius = 12.0
       
        profileCV.delegate = self
        profileCV.dataSource = self
        setProfile()
       
        
     //  self.navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
 

    
    func setProfile(){
        profileArray.append(contentsOf:
                                [ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인"),ProfileData(imageName: "jieun", profileName: "황지은", profileMsg: "#보라돌이 #ISFP #운팀2회차 #왕초보진심녀 #취중고백장인")]
        )
    }
}

extension ProfileVC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        return  profileArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCVCell", for: indexPath) as! BannerCVCell
            
            return bannerCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCVCell", for: indexPath) as! ProfileCVCell
        
        cell.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
      
        
        cell.nameLabel.text = profileArray[indexPath.row].profileName
        cell.profileImg.image = UIImage(named: profileArray[indexPath.row].imageName)
        cell.profileMsgLabel.text = profileArray[indexPath.row].profileMsg
        
        return cell
    }
    
    
}

