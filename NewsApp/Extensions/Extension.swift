//
//  Extension.swift
//  NewsApp
//
//  Created by Mouli Agastya on 9/14/26.
//

import UIKit

extension UIImageView {
    func fetchImageFromUrl(urlString: String) {
        guard let urlEndPoint = URL(string: urlString) else { return }
        
        let request = URLRequest(url: urlEndPoint)
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let _ = error {
                return
            }
            
            guard let jsonData = data else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: jsonData)
            }
        }.resume()
    }
}

extension String {
    func formatDate() -> String {
        let isoFormatter = ISO8601DateFormatter()
        guard let date = isoFormatter.date(from: self) else { return "" }
        return date.formatted(date: .abbreviated, time: .omitted)
    }
}
