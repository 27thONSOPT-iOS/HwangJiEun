//
//  ProfileCVCell.swift
//  3rd_Assignment_27th
//
//  Created by 황지은 on 2020/11/06.
//

import UIKit

class ProfileCVCell: UICollectionViewCell {
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var profileMsgLabel: UILabel!
    
    func setData(imageName:String,profileName:String,profileMsg:String){
        
        profileImg.image = UIImage(named: imageName)
        nameLabel.text = profileName
        profileMsgLabel.text = profileMsg
    }
}
