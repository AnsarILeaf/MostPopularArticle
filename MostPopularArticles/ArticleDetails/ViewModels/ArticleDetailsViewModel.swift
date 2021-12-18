//
//  ArticleDetailsViewModel.swift
//  MostPopularArticles
//
//  Created by Ansar on 16/12/21.
//

import Foundation

class ArticlesDetailsViewModel: NSObject {
     var heading:String
     var name:String
     var date:String
     var image:String?
     var detailImage:String?
     var details:String?

    
    init(article: Article) {
         heading = article.title ?? ""
         name = article.byline  ?? ""
         date = article.published_date ?? ""
        details = article.abstract ?? ""
        image = article.media?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.first?.url:"":""
        detailImage = article.media?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.count ?? 0 > 0 ? article.media?.first?.media_metadata?.last?.url:"":""
    }
}
