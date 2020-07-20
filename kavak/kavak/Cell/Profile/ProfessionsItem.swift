//
//  ProfessionsItem.swift
//  kavak
//
//  Created by Javier Hernandez on 19/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import Foundation
import UIKit
class ProfessionsItem: UICollectionViewCell,UICollectionViewDelegate {
    @IBOutlet weak var lblName: UILabel!
    
}

extension ProfessionsItem: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return lblName.text!.size(withAttributes: nil)
    }
}
