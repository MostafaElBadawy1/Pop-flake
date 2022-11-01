//
//  HomeViewModel.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import Foundation
class HomeViewModel {
    var movies = [Movie]()
    var inTheaterMovies = [Movie]()
    var top250Movies = [Movie]()
    var grossingMovies = [Movie]()
    var trailer: Trailer?
    func fetchCommingSoonMovies() async ->  [Movie]? {
        let movies = try? await NetworkManager.shared.fetchData(url: URLs.shared.commingSoonMoviesURL(),
                                                                model: Movies.self)
        return movies?.items
    }
    func fetchInThratersMovies() async ->  [Movie]? {
        let movies = try? await NetworkManager.shared.fetchData(url: URLs.shared.inTheatersMoviesURL(),
                                                                model: Movies.self)
        return movies?.items
    }
    func fetchTop250Movies() async ->  [Movie]? {
        let movies = try? await NetworkManager.shared.fetchData(url: URLs.shared.topRatedMoviesURL(),
                                                                model: Movies.self)
        return movies?.items
    }
    func fetchGrossingMovies() async ->  [Movie]? {
        let movies = try? await NetworkManager.shared.fetchData(url: URLs.shared.grossingMoviesURL(),
                                                                model: Movies.self)
        return movies?.items
    }
    func fetchTrailers(id: String) async ->  Trailer? {
        let trailer = try? await NetworkManager.shared.fetchData(url: URLs.shared.youTubeTrailerURL(id: id),
                                                                 model: Trailer.self)
        return trailer
    }
}
