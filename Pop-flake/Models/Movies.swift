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
    let year: String?
    let rank: String?
    let rate: String?
    let runtimeMins: String?
    let image: String?
    let weeks: String?
    let gross: String?
    let genres: String?
}
