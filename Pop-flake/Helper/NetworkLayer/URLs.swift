//
//  URLs.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//

import Foundation
struct URLs {
    static let shared = URLs()
    private init() {}
    let baseURL = "https://imdb-api.com/en/API/"
    // let apiKey =  "k_infolaqy"
   //  let apiKey = "k_3igz0bbg"
    // let apiKey = "k_mwg2cbdx"
     let apiKey = "k_ek0t3cu9"
    func commingSoonMoviesURL() -> URL? {
        return URL(string: baseURL + "ComingSoon/\(apiKey)")
    }
    func inTheatersMoviesURL() -> URL? {
        return URL(string: baseURL + "InTheaters/\(apiKey)")
    }
    func topRatedMoviesURL() -> URL? {
        return URL(string: baseURL + "Top250Movies/\(apiKey)")
    }
    func grossingMoviesURL() -> URL? {
        return URL(string: baseURL + "BoxOffice/\(apiKey)")
    }
    func searchURL(searchWord: String ) -> URL? {
        return URL(string: baseURL + "SearchAll/\(apiKey)/\(searchWord)")
    }
    func youTubeTrailerURL(id: String) -> URL? {
        return URL(string: baseURL + "Trailer/\(apiKey)/\(id)")
    }
}
