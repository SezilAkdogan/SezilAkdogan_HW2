//
//  ViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//


import UIKit

class TopStoriesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var topStoriesViewModel: TopStoriesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = topStoriesViewModel?.selectedSection.uppercased()
        topStoriesViewModel?.delegate = self
        topStoriesViewModel?.fetchNews()
        tableView.registerWithNib(NewsTableViewCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension TopStoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStoriesViewModel?.numberOfRow() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self, for: indexPath) as NewsTableViewCell
        if let article = topStoriesViewModel?.cellForRow(at: indexPath) {
            cell.configure(model: article)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        if let news = topStoriesViewModel?.news, indexPath.row < news.count {
            let selectedNews = news[indexPath.row]
            let detailsViewModel = DetailsViewModel(article: selectedNews)
            detailsVC.detailVM = detailsViewModel
        }


        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension TopStoriesViewController: TopStoriesViewModelDelegate {
    func didLoadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didLoadFailed() {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: "Could not load data!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
    func showLoading() {
        LoadingViewManager.shared.startLoading()
    }
    
    func hideLoading() {
        LoadingViewManager.shared.hideLoading()
    }
}
