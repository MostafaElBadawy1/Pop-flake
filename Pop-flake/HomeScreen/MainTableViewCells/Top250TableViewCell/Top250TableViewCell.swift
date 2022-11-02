//
//  Top250TableViewCell.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 01/11/2022.
//
import UIKit
class Top250TableViewCell: UITableViewCell {
    let homeViewModel = HomeViewModel()
    @IBOutlet weak var top250CollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewConfig()
        fetchTop250Movies()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func collectionViewConfig() {
        top250CollectionView.delegate = self
        top250CollectionView.dataSource = self
        top250CollectionView.register(UINib(nibName: K.moviesCollectionViewCell, bundle: .main),
                                      forCellWithReuseIdentifier: K.moviesCollectionViewCell)
    }
    func fetchTop250Movies() {
        Task.init {
            if let top250Movies = await homeViewModel.fetchTop250Movies() {
                self.homeViewModel.top250Movies = top250Movies
                DispatchQueue.main.async {
                    self.top250CollectionView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
extension Top250TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.top250Movies.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = top250CollectionView.dequeueReusableCell(withReuseIdentifier: K.moviesCollectionViewCell,
                                                                 for: indexPath) as? MoviesCollectionViewCell
        cell!.movieNameLabel.text = homeViewModel.top250Movies[indexPath.item].title
        cell?.yearLabel.text = homeViewModel.top250Movies[indexPath.item].year
        if let url = homeViewModel.top250Movies[indexPath.item].image {
            cell!.movieImageView.kf.setImage(with: URL(string: url))
        }
        cell!.rankLabel.text = "Rank: \(homeViewModel.top250Movies[indexPath.item].rank!)"
        cell?.durationLabel.text = "Rate: \(homeViewModel.top250Movies[indexPath.item].imDbRating!)"
        return cell!
    }
}
extension Top250TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 350)
    }
}
