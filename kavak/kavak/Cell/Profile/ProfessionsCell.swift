//
//  ProfessionsCell.swift
//  kavak
//
//  Created by Javier Hernandez on 19/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import Foundation
import UIKit

class ProfessionsCell: UITableViewCell {
    @IBOutlet weak var lblProfessions: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblExperence: UILabel!
    @IBOutlet weak var imgStars: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    
    var gnome = Gnome()
     var isProfessions = true
     
     func setUI() {
         viewContainer.layer.shadowOpacity = 0.7
         viewContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
         viewContainer.layer.shadowRadius = 7.0
         viewContainer.layer.shadowColor = UIColor.darkGray.cgColor
         viewContainer.layer.cornerRadius = 10
         
         if isProfessions {
             let count = gnome.professions.count >= 5 ? 5 : gnome.professions.count
             imgStars.image = UIImage(named: "\(count)Stars")
             lblExperence.text = "Nivel de Experiencia"
             lblProfessions.text = "Profeciones"
            viewContainer.backgroundColor = General.getColor(color: self.gnome.hair_color ?? "")//hexColor(hex: "FFC857")
         } else {
             var count = gnome.friends.count >= 5 ? 5 : gnome.friends.count
             count = gnome.friends.count == 0 ? 1 : count
             imgStars.image = UIImage(named: "\(count)Stars")
             lblExperence.text = "Nivel de Amistad"
             lblProfessions.text = "Amigos"
             viewContainer.backgroundColor = General.getColor(color: self.gnome.hair_color ?? "")//hexColor(hex: "009B72")
         }
         collectionView.delegate = self
         collectionView.dataSource = self
     }
     
     func hexColor(hex:String) -> UIColor {
         var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
         
         if (cString.hasPrefix("#")) {
             cString.remove(at: cString.startIndex)
         }
         
         if ((cString.count) != 6) {
             return UIColor.gray
         }
         
         var rgbValue:UInt32 = 0
         Scanner(string: cString).scanHexInt32(&rgbValue)
         
         return UIColor(
             red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
             green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
             blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
             alpha: CGFloat(1.0)
         )
     }
    
}

extension ProfessionsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isProfessions {
            return gnome.professions.count
        }
        return gnome.friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfessionsItem", for: indexPath) as! ProfessionsItem
        if isProfessions {
            item.lblName.text = gnome.professions[indexPath.row]
        } else {
            item.lblName.text = gnome.friends[indexPath.row]
        }
        return item
    }
    
}


