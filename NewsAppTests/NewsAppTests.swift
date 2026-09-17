//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by Mouli Agastya on 9/14/26.
//

import XCTest
@testable import NewsApp

final class NewsAppTests: XCTestCase {
    
    var objCalculator: Calculator?
    var newsHomeViewModel: NewsHomeViewModelProtocol?
    
    override func setUpWithError() throws {
        objCalculator = Calculator()
        newsHomeViewModel = MockNewsHomeViewModel()
    }

    override func tearDownWithError() throws {
        objCalculator = nil
    }
    
    func testSum() {
        let sumResult = objCalculator?.sum(n1: 1, n2: 2)
        XCTAssertEqual(sumResult, 3)
        
        let optionlSum1 = objCalculator?.sum(n1: nil, n2: 2)
        XCTAssertEqual(optionlSum1, 0)
        
        let optionlSum2 = objCalculator?.sum(n1: 1, n2: nil)
        XCTAssertEqual(optionlSum2, 0)
        
        let optionlSum3 = objCalculator?.sum(n1: nil, n2: nil)
        XCTAssertEqual(optionlSum3, 0)
    }
    
    func testSub() {
        
    }
    
    func testMul() {
        
    }
    
    func testDiv() {
        
    }
    
    func testGetTotalNewsCount() {
        let count = newsHomeViewModel?.getTotalNewsCount()
        XCTAssertEqual(count, 0)
    }
    
    func testGetNews() {
        let news = newsHomeViewModel?.getNews(for: 0)
        XCTAssertNil(news)
    }
}


