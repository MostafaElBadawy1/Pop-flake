//
//  Trailer.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 31/10/2022.
//

import Foundation
struct Trailer: Codable {
    let title: String?
    let fullTitle: String?
    let link: String?
    let thumbnailUrl: String?
    let errorMessage: String
    var image: String?
}
