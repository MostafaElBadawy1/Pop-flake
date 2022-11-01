//
//  CommingSoonTableViewCell.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
import Kingfisher
class CommingSoonTableViewCell: UITableViewCell {
    let homeViewModel = HomeViewModel()
    @IBOutlet weak var commingSoonCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewConfig()
        //fetchComingSoonMovies()
    }
    func collectionViewConfig() {
        commingSoonCollectionView.delegate = self
        commingSoonCollectionView.dataSource = self
        commingSoonCollectionView.register(UINib(nibName: K.moviesCollectionViewCell, bundle: .main),
                                           forCellWithReuseIdentifier: K.moviesCollectionViewCell)
    }
    func fetchComingSoonMovies() {
        Task.init {
            if let movies = await homeViewModel.fetchCommingSoonMovies() {
                self.homeViewModel.movies = movies
                DispatchQueue.main.async {
                    self.commingSoonCollectionView.reloadData()
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
extension CommingSoonTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.movies.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = commingSoonCollectionView.dequeueReusableCell(withReuseIdentifier: K.moviesCollectionViewCell,
                                                                 for: indexPath) as? MoviesCollectionViewCell
        cell!.movieNameLabel.text = homeViewModel.movies[indexPath.item].title
        cell?.yearLabel.text = homeViewModel.movies[indexPath.item].year
        if let url = homeViewModel.movies[indexPath.item].image {
        cell!.movieImageView.kf.setImage(with: URL(string: url))
         }
         cell!.rankLabel.text =  homeViewModel.movies[indexPath.item].genres
        cell?.durationLabel.isHidden = true
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        commingSoonCollectionView.deselectItem(at: indexPath, animated: true)
    }
}
extension CommingSoonTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 350)
    }
}
