//
//  HomeVCCollectionView+Ext.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 02/11/2022.
//
import UIKit
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.trailersArray.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = headerCollectionView.dequeueReusableCell(withReuseIdentifier:
                                                                K.headerCollectionViewCellID,
                                                            for: indexPath) as? HeaderCollectionViewCell
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [self] in
            cell?.movieTitleLabel.text = homeViewModel.trailersArray[indexPath.item].fullTitle
            if let url = homeViewModel.trailersArray[indexPath.item].thumbnailUrl {
                cell!.trailerImageView.kf.setImage(with: URL(string: url))
            }
            cell!.movieImageView.kf.setImage(with: URL(string: homeViewModel.trailersImageArray[indexPath.item]))
        }
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        headerCollectionView.deselectItem(at: indexPath, animated: true)
        let safariVC = UIStoryboard(name: "Main",
                                    bundle: .main).instantiateViewController(withIdentifier:
                                                                                K.safariViewControllerID) as? SafariViewController
        if let link =  homeViewModel.trailersArray[indexPath.item].link {
            safariVC?.passedUrl = URL(string: link)
        }
        navigationController?.pushViewController(safariVC!, animated: true)
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return CGSize(width: view.frame.size.width, height: 300)
    }
}
