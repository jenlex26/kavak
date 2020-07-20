//
//  ProfileVC.swift
//  kavak
//
//  Created by Javier Hernandez on 19/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import Foundation
import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var gnome = Gnome()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = gnome.name
        
        // Do any additional setup after loading the view.
    }
}
extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
             return 212
        } else if indexPath.row == 1 {
            return 127
        } else if indexPath.row == 2 {
            return 171
        } else {
            return 171
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
            cell.gnome = self.gnome
            cell.setUI()
            return cell
        } else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCell") as! InformationCell
            cell.gnome =  self.gnome
            cell.setUI()
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessionsCell") as! ProfessionsCell
            cell.isProfessions = true
            cell.gnome = gnome
            cell.setUI()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessionsCell") as! ProfessionsCell
            cell.isProfessions = false
            cell.gnome = gnome
            cell.setUI()
            return cell
        }
    }
    
    
}
