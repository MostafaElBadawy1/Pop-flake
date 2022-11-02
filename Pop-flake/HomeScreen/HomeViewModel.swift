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
    var trailerOne: Trailer?
    var trailerTwo: Trailer?
    var trailerThree: Trailer?
    var trailersArray = [Trailer]()
    let trailersImageArray = ["https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,3,128,176_AL_.jpg"
        ,"https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,1,128,176_AL_.jpg"
        ,"https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX128_CR0,3,128,176_AL_.jpg"]
    var counter = 0
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
