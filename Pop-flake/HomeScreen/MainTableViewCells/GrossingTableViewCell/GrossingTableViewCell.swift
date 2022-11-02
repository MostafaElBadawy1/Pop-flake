//
//  GrossingTableViewCell.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import UIKit
class GrossingTableViewCell: UITableViewCell {
    let homeViewModel = HomeViewModel()
    @IBOutlet weak var grossingTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        tableViewConfig()
        fetchGrossingMovies()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func tableViewConfig() {
        grossingTableView.delegate = self
        grossingTableView.dataSource = self
        grossingTableView.register(UINib(nibName: K.moviesTableViewCellID, bundle: .main),
                                   forCellReuseIdentifier: K.moviesTableViewCellID)
    }
    func fetchGrossingMovies() {
        Task.init {
            if let grossingMovies = await homeViewModel.fetchGrossingMovies() {
                self.homeViewModel.movies = grossingMovies
                DispatchQueue.main.async {
                    self.grossingTableView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
extension GrossingTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.movies.count
    }
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = grossingTableView.dequeueReusableCell(withIdentifier: K.moviesTableViewCellID,
                                                         for: indexPath) as? MoviesTableViewCell
        cell?.movieNameLabel.text = homeViewModel.movies[indexPath.row].title
        if let url = homeViewModel.movies[indexPath.row].image {
            cell!.movieImageView.kf.setImage(with: URL(string: url))
        }
        cell?.weeksLabel.text = "Weeks: \(homeViewModel.movies[indexPath.row].weeks!)"
        cell?.rankLabel.text = "Rank: \(homeViewModel.movies[indexPath.row].rank!)"
        cell?.grossLabel.text = "Gross: \(homeViewModel.movies[indexPath.row].gross!)"
        return cell!
    }
}
