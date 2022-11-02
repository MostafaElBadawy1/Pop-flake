//
//  Movies.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import Foundation
struct Movies: Codable {
    let items: [Movie]
}
struct Movie: Codable {
    let id: String?
    let title: String?
    let fullTitle: String?
    let year: String?
    let rank: String?
    let imDbRating: String?
    let rate: String?
    let runtimeMins: String?
    let runtimeStr: String?
    let image: String?
    let weeks: String?
    let gross: String?
    let genres: String?
    let errorMessage: String?
}
