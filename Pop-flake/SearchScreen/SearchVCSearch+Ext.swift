//
//  SearchVCSearch+Ext.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import UIKit
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       guard let text = searchController.searchBar.text else { return }
        var urlString = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        searchMovies(searchWord: urlString!)
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        initViewModel()
        return true
    }
}
