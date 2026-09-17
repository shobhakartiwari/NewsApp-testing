//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Mouli Agastya on 9/14/26.
//

import UIKit

protocol NetworkProtocol {
    func fetchNewsData(urlString: String, completionHandler: @escaping (News?) -> ())
}

class NetworkManager: NetworkProtocol {
    static let shared = NetworkManager()
    
    private init() {}
    
    // MARK: - Service method
    
    func fetchNewsData(urlString: String, completionHandler: @escaping (News?) -> ()) {
        guard let urlEndPoint = URL(string: urlString) else { return }
        
        let request = URLRequest(url: urlEndPoint)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                print("Error occured in url session (error)")
                completionHandler(nil)
                return
            }
            
            guard let jsonData = data else {
                print("Error occured in getting data")
                completionHandler(nil)
                return
            }
            
            do {
                let newsList = try JSONDecoder().decode(News?.self, from: jsonData)
                completionHandler(newsList)
                return
            } catch {
                print("Failed to parse the data")
                completionHandler(nil)
                return
            }
        }.resume()
    }
}
