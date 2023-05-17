//
//  ViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit
import NewsAPI

final class TopStoriesViewController: UIViewController, ArticleFetchDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var topStoriesViewModel: TopStoriesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = topStoriesViewModel?.selectedSection.uppercased()
        topStoriesViewModel?.delegate = self
//        topStoriesViewModel?.fetchTopStories()
        topStoriesViewModel?.fetch()
        tableView.registerWithNib(NewsTableViewCell.self)
    }
    
    let service: TopStoriesServiceProtocol = TopStoriesService()
    private var news: [NewsResult] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        fetchNews()
    }
    
//    fileprivate func fetchNews() {
//        self.showLoading()
//        service.fetchTopStories { [weak self] response in
//            guard let self else { return }
//            self.hideLoading()
//            switch response {
//            case .success(let news):
//                print("Sezil: \(news)")
//                self.news = news
//                self.tableView.reloadData()
//            case .failure(let error):
//                print("Sezil: \(error)")
//            }
        }
    
extension TopStoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStoriesViewModel?.numberOfRow(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self, for: indexPath) as NewsTableViewCell
        if let article = topStoriesViewModel?.cellForRow(indexPath: indexPath) {
            cell.titleLabel.text = article.title
            cell.subTitleLabel.text = article.abstract
            cell.authorLabel.text = article.byline
            if let multimediaList = article.multimedia {
                for multimedia in multimediaList {
                    if multimedia.type == .image &&
                                           multimedia.subtype ==
                                           .photo {
                        cell.imageIconView.setCustomImage(multimedia.url) //Better approach?
                        break
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        DetailsVC.article = topStoriesViewModel?.articles[indexPath.row]
        self.navigationController?.pushViewController(DetailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //MARK:- API responses
    func didLoadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didLoadFailed() {
        DispatchQueue.main.async {
            let alertController = UIAlertController.init(title: "Error Occurred", message: "Could not load data!", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default) { ( action ) in
                //Throw user out. Error occurred.
                //Or retry.
                //Look into parsing errors.
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
}


/*
extension ViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeCell(cellType: PopularMovieCell.self, indexPath: indexPath)
        let movie = self.movies[indexPath.row]
        cell.configure(movie: movie)
        
        return cell
    }

}

*/

