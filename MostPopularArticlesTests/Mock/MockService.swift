

import Foundation
@testable import MostPopularArticles

class MockService : ServiceProtocol {
    
    func fetchArticleList(periods: Periods, completion: @escaping ([Article]?) -> Void) {
        completion(mockData)
    }
    
    let mockData: [Article]?
    
    init(mockData: [Article]?) {
        self.mockData = mockData
    }
    
}
