//
//  TrailersTableViewHeader.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 01/11/2022.
//
import UIKit
class TrailersTableViewHeader: UITableViewHeaderFooterView {
    let homeViewModel = HomeViewModel()
    @IBOutlet weak var trailersCollectionView: UICollectionView!
    override class func awakeFromNib() {
       // self.collectionViewConfig()
    }
    func collectionViewConfig() {
        trailersCollectionView.delegate = self
        trailersCollectionView.dataSource = self
        trailersCollectionView.register(UINib(nibName: K.headerCollectionViewCellID, bundle: .main),
                                           forCellWithReuseIdentifier: K.headerCollectionViewCellID)
    }
    
}
extension TrailersTableViewHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.trailersArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = trailersCollectionView.dequeueReusableCell(withReuseIdentifier: K.headerCollectionViewCellID, for: indexPath)
        
        return cell
    }
    
    
}
