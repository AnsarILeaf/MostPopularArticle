//
//  ArticleDetailsViewController.swift
//  MostPopularArticles
//
//  Created by Ansar on 16/12/21.
//

import UIKit
import Kingfisher

class ArticleDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var dateIcon:UIImageView!
    @IBOutlet weak var articleIcon:UIImageView!
    
    var viewModel : ArticlesDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
        // Do any additional setup after loading the view.
    }
    
    func setValues() {
        
        guard let viewModel = viewModel else {
            return
        }
        titleLabel?.text = viewModel.heading
        byLineLabel?.text = viewModel.details
        dateLabel?.text = viewModel.date
        
        if let urlStr = viewModel.image {
            let url = URL(string: urlStr)
            
            articleIcon.kf.indicatorType = .activity
            articleIcon.kf.setImage(
                with: url,
                placeholder: UIImage(named: "placeHolder"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    static func storyboardInstance() -> ArticleDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsViewController") as! ArticleDetailsViewController
        return vc
    }
    
}
