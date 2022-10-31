//
//  SearchViewModel.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import Foundation
class SearchViewModel {
    var movies = [SearchedMovie]()
    func fetchMovies(searchWord: String) async ->  [SearchedMovie]? {
        let movies = try? await NetworkManger.shared.fetchData(url: URLs.shared.searchURL(searchWord: searchWord),
                                                               model: SearchedMovies.self)
        return movies?.results
    }
}
