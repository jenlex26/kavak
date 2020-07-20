//
//  ViewController.swift
//  kavak
//
//  Created by Javier Hernandez on 17/07/20.
//  Copyright © 2020 Javier Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var isImage = false
    var arrGnome = [Gnome]()
    var arrFilter = [Gnome]()
    var index = 0
    let refresher = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
         self.collectionView!.alwaysBounceVertical = true
         self.refresher.tintColor = UIColor.darkGray
         self.refresher.addTarget(self, action: #selector(loadData), for: .valueChanged)
         self.collectionView!.addSubview(refresher)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Buscar"
        search.delegate = self
        self.navigationItem.searchController = search
        self.title = "Brastlewark"
        getGnomes()
      
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func loadData() {
       getGnomes()
     }

    func stopRefresher() {
       self.refresher.endRefreshing()
     }
    
    func getGnomes() {
        let service = ServiceCall()
        service.initWithURl { (success, obj) in
            if  success {
                guard let arr = obj as? [Gnome] else { return }
                self.arrGnome = arr
                self.arrFilter = self.arrGnome
                DispatchQueue.main.async {
                    self.stopRefresher()
                    self.collectionView.reloadData()
                }
            } else {
                
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getGnomes()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ProfileVC {
            vc.gnome = arrFilter[index]
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrFilter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemGnome", for: indexPath) as! ItemGnome
        item.nameCollection.text = arrFilter[indexPath.row].name
        guard let urlImage = arrFilter[indexPath.row].thumbnail else { return item }
        item.imageCollection.sd_setImage(with: URL(string: urlImage), placeholderImage: UIImage(named: "Image-1"))

        
        return item
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        index = indexPath.row
        self.performSegue(withIdentifier: "ShowProfileSegue", sender: nil)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height / 3)
        return size
    }
    
}
extension ViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text!.isEmpty {
            arrFilter = arrGnome
            self.collectionView.reloadData()
            return
        }else{
            arrFilter = arrFilter.filter({
                ($0.name?.lowercased().contains(searchController.searchBar.text!.lowercased()))!
            })
            arrGnome =  arrFilter.count == 0 ? arrGnome :  arrFilter
            collectionView.reloadData()
        }

    }
}
