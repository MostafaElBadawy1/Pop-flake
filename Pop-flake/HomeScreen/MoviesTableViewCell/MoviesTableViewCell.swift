//
//  MoviesTableViewCell.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
class MoviesTableViewCell: UITableViewCell {
    let searchViewModel = SearchViewModel()
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var grossLabel: UILabel!
    @IBOutlet weak var weeksLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//    func setSearchCell(indexPath: Int) {
// //        if let url = searchViewModel.movies[indexPath].image {
// //            movieImageView.kf.setImage(with: URL(string: url))}
//        movieNameLabel.text = searchViewModel.movies[indexPath].title
//        grossLabel.text = searchViewModel.movies[indexPath].description
//        weeksLabel.isHidden = true
//        rankLabel.isHidden = true
//    }
}
