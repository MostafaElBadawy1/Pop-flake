//
//  SearchVCSearch+Ext.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import UIKit
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(reload), object: nil)
        self.perform(#selector(reload), with: nil, afterDelay: 1)
    }
    @objc func reload() {
        guard let text = searchController.searchBar.text else { return }
        let urlString = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        searchMovies(searchWord: urlString!)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else { return }
        let urlString = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        searchMovies(searchWord: urlString!)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        initViewModel()
    }
}
