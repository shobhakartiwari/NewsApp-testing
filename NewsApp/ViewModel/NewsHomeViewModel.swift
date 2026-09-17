//
//  NewsHomeViewModel.swift
//  NewsApp
//
//  Created by Shobhakar Tiwari on 9/14/26.
//

protocol NewsHomeViewModelProtocol: AnyObject {
    var newsList: News? { get set }
    func fetchNews(completion: @escaping ()->())
    func getTotalNewsCount() -> Int
    func getNews(for index: Int) -> Article?
}

class NewsHomeViewModel: NewsHomeViewModelProtocol {
    var newsList: News?
    let objNetwork: NetworkProtocol?
    
    init(objNetwork: NetworkProtocol? = nil) {
        self.objNetwork = objNetwork
    }
}

// MARK: Service Methods

extension NewsHomeViewModel {
    func fetchNews(completion: @escaping ()->()) {
        objNetwork?.fetchNewsData(urlString: Server.newsEndPoint.rawValue, completionHandler: { [weak self] fetchedNewsList in
            self?.newsList = fetchedNewsList
            // To update VIEW that data is being fetched successfully!
            completion()
        })
    }
}

// MARK: Helper Methods

extension NewsHomeViewModel {
    func getTotalNewsCount() -> Int {
        newsList?.articles.count ?? 0
    }
    
    func getNews(for index: Int) -> Article? {
        guard let newsList = newsList, index < newsList.articles.count else { return nil }
        return newsList.articles[index]
    }
}
