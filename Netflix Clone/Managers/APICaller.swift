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
    
    func getTrendingMovie(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let url =  URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)")else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data , _ , error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
                
            }catch {
                completion(.failure(APIError.failedTogetData))
                
            }
        }
        task.resume()
    }
    
    func getTrendingTv(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _ , error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
        
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared
            .dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                }catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
        task.resume()
    }
    
    func getpopular(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared
            .dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                }catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void){
        guard let url = URL(string:"\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1")else {return}
        let task = URLSession.shared
            .dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                
                }catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
        task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        
        
        guard let url = URL(string:"\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=falsefalse&page=1&with_watch_monetization_types=flatrate")else {return}
        let task = URLSession.shared
            .dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                
                }catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
        task.resume()
        
    }
    
    func search(with query:String,completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
     
        let task = URLSession.shared
            .dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                    completion(.success(results.results))
                
                }catch {
                    completion(.failure(APIError.failedTogetData))
                }
            }
        task.resume()
        
    }
}
