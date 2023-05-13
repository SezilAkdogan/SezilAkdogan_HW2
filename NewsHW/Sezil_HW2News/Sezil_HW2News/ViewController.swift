//
//  ViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit
import NewsAPI

final class ViewController: UIViewController, LoadingShowable {

   
    @IBOutlet weak var tableView: UITableView!
    
    let service: TopStoriesServiceProtocol = TopStoriesService()
    private var news: [NewsResult] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchMovies()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(cellType: NewsTableViewCell.self)
    }

    fileprivate func fetchMovies() {
        self.showLoading()
        service.fetchTopStories { [weak self] response in
            guard let self else { return }
            self.hideLoading()
            switch response {
            case .success(let news):
                print("Sezil: \(news)")
                self.news = news
                self.tableView.reloadData()
            case .failure(let error):
                print("Sezil: \(error)")
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
