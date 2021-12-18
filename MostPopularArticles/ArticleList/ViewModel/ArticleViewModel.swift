//
//  ArticleViewModel.swift
//  MostPopularArticles
//
//  Created by Ansar on 15/12/21.
//

import Foundation


import Combine
import Foundation
import UIKit


class ArticlesViewModel: NSObject {
    
     var articleList : Articles
     var period = Periods.Week
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.articleList = []
        self.service = service
    }
    
    func loadData(finished: @escaping () -> Void) {
        service.fetchArticleList(periods: period, completion: {  articles in
            guard let articles = articles else {
                return
            }
            self.articleList = articles
            finished()
        })
    }
}

extension ArticlesViewModel : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        cell.configCellUI()
        cell.viewModel = ArticlesDetailsViewModel(article: self.articleList[indexPath.row])
        return cell
    }
    
  
    
}
