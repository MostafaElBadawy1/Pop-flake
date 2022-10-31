//
//  NetworkManger.swift
//  Pop-flake
//
//  Created by Mostafa Elbadawy on 30/10/2022.
//
import Foundation
class NetworkManger {
    static let shared = NetworkManger()
    private init() {}
    func fetchData<T: Codable>(url: URL?, model: T.Type) async throws -> T {
        let (data, _) =  try await URLSession.shared.data(from: url!)
        return try JSONDecoder().decode(model, from: data)
    }
}
