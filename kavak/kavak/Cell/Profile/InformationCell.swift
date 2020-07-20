//
//  InformationCell.swift
//  kavak
//
//  Created by Javier Hernandez on 19/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import Foundation
import UIKit

class InformationCell: UITableViewCell {
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    
    var gnome = Gnome()
    
    func setUI() {
        viewContainer.layer.shadowOpacity = 0.7
        viewContainer.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewContainer.layer.shadowRadius = 15.0
        viewContainer.layer.shadowColor = UIColor.darkGray.cgColor
        viewContainer.layer.cornerRadius = 10
        viewContainer.backgroundColor = General.getColor(color: self.gnome.hair_color ?? "")
        hairColor.text = "Color de Pelo: \(gnome.hair_color ?? "")"
        lblAge.text = "Edad: \(gnome.age ?? 0)"
        lblHeight.text = "Altura: \(gnome.height ?? 0)"
        lblWeight.text = "Peso:\(gnome.weight ?? 0)"
        
    }
}
