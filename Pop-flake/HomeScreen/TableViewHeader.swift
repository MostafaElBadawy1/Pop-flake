//
//  TableViewHeader.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import UIKit
class HomeTableViewHeader: UITableViewHeaderFooterView {
    let layout = UICollectionViewFlowLayout()
    lazy var trailersCollectionView: UICollectionView = {
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let aspectRatio = 1.5436
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = width / aspectRatio
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        layout.itemSize = CGSize(width: width, height: height)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(trailersCollectionView)
        trailersCollectionView.register(UINib(nibName: K.headerCollectionViewCellID, bundle: .main), forCellWithReuseIdentifier: K.headerCollectionViewCellID)
//        trailersCollectionView.dataSource = HomeViewController
//        trailersCollectionView.delegate = HomeViewController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
