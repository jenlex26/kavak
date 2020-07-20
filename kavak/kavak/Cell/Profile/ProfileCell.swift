//
//  ProfileCell.swift
//  kavak
//
//  Created by Javier Hernandez on 19/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class ProfileCell: UITableViewCell {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    var gnome = Gnome()

    func setUI() {
        
        img.layer.shadowOpacity = 0.7
        img.layer.shadowOffset = CGSize(width: 0, height: 3)
        img.layer.shadowRadius = 15.0
        img.layer.shadowColor = UIColor.darkGray.cgColor
        img.layer.cornerRadius = 75
        img.layer.borderColor = General.getColor(color: self.gnome.hair_color ?? "").cgColor
        img.layer.borderWidth = 3
        lbl.text = gnome.name
        guard let urlImage = gnome.thumbnail else { return }
        img.sd_setImage(with: URL(string: urlImage), placeholderImage: UIImage(named: "Image-1"))
        
    }
}
