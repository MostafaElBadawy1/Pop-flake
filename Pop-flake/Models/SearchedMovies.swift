//
//  SearchedMovies.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//
import Foundation
struct SearchedMovies: Codable {
    let results: [SearchedMovie]
}
struct SearchedMovie: Codable {
    let id: String?
    let title: String
    let image: String?
    let description: String?
    let errorMessage: String?
}
