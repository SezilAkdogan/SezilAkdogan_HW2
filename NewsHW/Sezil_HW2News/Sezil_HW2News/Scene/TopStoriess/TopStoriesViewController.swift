//
//  ViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit

final class TopStoriesViewController: UIViewController, TopStoriesViewModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var topStryViewModel: TopStoriesViewModelProtocol!{
        didSet{
            topStryViewModel?.delegate = self
        }
    }
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
        return topStoriesViewModel?.numberOfRow(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: NewsTableViewCell.self, for: indexPath) as NewsTableViewCell
        if let article = topStoriesViewModel?.cellForRow(indexPath: indexPath) {
            cell.configure(model: article)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        DetailsVC.article = topStoriesViewModel?.news[indexPath.row]
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
            let alertController = UIAlertController.init(title: "Error", message: "Could not load data!", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "OK", style: .default) { ( action ) in
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
        }
    }
    
}

