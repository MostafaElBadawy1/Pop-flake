//
//  SearchVCTableView+Ext.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import UIKit
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchViewModel.movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCell(withIdentifier: K.moviesTableViewCellID,
                                                              for: indexPath) as? MoviesTableViewCell
        if let url = searchViewModel.movies[indexPath.row].image {
            cell?.movieImageView.kf.setImage(with: URL(string: url), placeholder: UIImage(named: "popcorn"))
        }
            cell?.movieNameLabel.text = searchViewModel.movies[indexPath.row].title
            cell?.grossLabel.text = searchViewModel.movies[indexPath.row].description
            cell?.rankLabel.isHidden = true
            cell?.weeksLabel.isHidden = true
            // cell?.setSearchCell(indexPath: indexPath.row)
            return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchResultsTableView.deselectRow(at: indexPath, animated: true)
       let movieUrl = URL(string: "https://www.imdb.com/title/\(searchViewModel.movies[indexPath.row].id!)/")
        let safariVC = UIStoryboard(name: "Main",
                                    bundle: nil).instantiateViewController(withIdentifier:
                                                                            K.safariViewControllerID) as? SafariViewController
        safariVC?.passedUrl = movieUrl
        navigationController?.pushViewController(safariVC!, animated: true)
    }
}
