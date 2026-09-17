//
//  NewsDetailsViewModel.swift
//  NewsApp
//
//  Created by Shobhakar Tiwari on 9/15/26.
//

class MockNewsHomeViewModel: NewsHomeViewModelProtocol {
    var newsList: News?
    
    func fetchNews(completion: @escaping () -> ()) {
        
        let article: Article = Article(title: "Tesla: The Top Is Here", description: "To say that Tesla has been on fire lately is an understatement. The stock has gone parabolic, Bitcoin like, vertical in recent weeks.The company's market cap is now around $160 billion, and its projected 2020 P/E multiple is roughly 113.Stocks cannot continuo…", urlToImage: "https://www.ccn.com/wp-content/uploads/2020/02/shutterstock_785518696.jpg", publishedAt: "2020-02-05T15:44:01Z")
        let fetchedNewsList = News(articles: [article])
        newsList = fetchedNewsList
        // To update VIEW that data is being fetched successfully!
        completion()
    }
    
    
    func getTotalNewsCount() -> Int {
        newsList?.articles.count ?? 0
    }
    
    func getNews(for index: Int) -> Article? {
        guard let newsList = newsList, index < newsList.articles.count else { return nil }
        return newsList.articles[index]
    }
}
