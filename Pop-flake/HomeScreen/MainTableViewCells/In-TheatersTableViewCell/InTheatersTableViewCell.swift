//
//  InTheatersTableViewCell.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 01/11/2022.
//

import UIKit

class InTheatersTableViewCell: UITableViewCell {
    let homeViewModel = HomeViewModel()
    @IBOutlet weak var inTheatersCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewConfig()
        fetchInTheatersMovies()
    }
    func collectionViewConfig() {
        inTheatersCollectionView.delegate = self
        inTheatersCollectionView.dataSource = self
        inTheatersCollectionView.register(UINib(nibName: K.moviesCollectionViewCell, bundle: .main),
                                          forCellWithReuseIdentifier: K.moviesCollectionViewCell)
    }
        func fetchInTheatersMovies() {
            Task.init {
                if let inTheaterMovies = await homeViewModel.fetchInThratersMovies() {
                    self.homeViewModel.inTheaterMovies = inTheaterMovies
                    DispatchQueue.main.async {
                        self.inTheatersCollectionView.reloadData()
                    }
                } else {
                    print("error")
                }
            }
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
extension InTheatersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeViewModel.inTheaterMovies.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = inTheatersCollectionView.dequeueReusableCell(withReuseIdentifier: K.moviesCollectionViewCell,
                                                                 for: indexPath) as? MoviesCollectionViewCell
        cell!.movieNameLabel.text = homeViewModel.inTheaterMovies[indexPath.item].title
        cell?.yearLabel.text = homeViewModel.inTheaterMovies[indexPath.item].year
        if let url = homeViewModel.inTheaterMovies[indexPath.row].image {
        cell!.movieImageView.kf.setImage(with: URL(string: url))
         }
        cell!.rankLabel.text =  "Rate: \(homeViewModel.inTheaterMovies[indexPath.item].imDbRating!)"
        cell?.durationLabel.text = homeViewModel.inTheaterMovies[indexPath.item].runtimeStr
        return cell!
    }
}
extension InTheatersTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 350)
    }
}
