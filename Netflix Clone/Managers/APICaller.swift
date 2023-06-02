//
//  APICaller.swift
//  Netflix Clone
//
//  Created by MicroBanker Nepal Pvt. Ltd. on 02/06/2023.
//

import Foundation

struct Constants {
    static let API_KEY = "edef22c5d8e600de1e2f6a1bd6405942"
    static let baseURL = "https://api.themoviedb.org"
}
enum APIError: Error {
    case failedTogetData
}
class Apicaller {
    static let shared = Apicaller()
    
    func getTrendingMoview(comletion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url =  URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)")else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data , _ , error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(trendingMoviewResponse.self, from: data)
                comletion(.success(results.results))

            }catch {
                comletion(.failure(error))            }
        }
        task.resume()
    }
}
