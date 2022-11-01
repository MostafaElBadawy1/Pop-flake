//
//  TrailersCollectionViewHandler.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import UIKit
// class TrailersCollectionHandler: UICollectionViewDataSource,
// UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    var homeViewModel = HomeViewModel()
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return homeViewModel.trailer
//    }
//    func collectionView(_ collectionView: UICollectionView,
// cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieTrailerCell.identifier,
// for: indexPath) as! MovieTrailerCell
//        viewModel?.configure(cell, at: indexPath)
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! MovieTrailerCell
//        if let videoURL = URL(string: cell.clickableLink) {
//            UIApplication.shared.open(videoURL)
//        }
//        collectionView.deselectItem(at: indexPath, animated: true)
//    }
// }
