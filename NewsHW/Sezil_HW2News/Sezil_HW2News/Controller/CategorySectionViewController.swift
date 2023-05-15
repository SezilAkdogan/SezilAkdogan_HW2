//
//  CategorySectionViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit

class CategorySectionViewController: UIViewController {
    
    var categorySection = CategorySectionViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categorySection.fetchPosts()
    }
    
}

extension CategorySectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - CollectionView Delegates and DataSources
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categorySection.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CategorySectionCollectionViewCell
        cell.titleLabel.text = categorySection.sections[indexPath.row].title
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.black.cgColor;
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var noOfCellsInRow = 3
        if (
            UIApplication.shared.statusBarOrientation
            == .landscapeLeft ||
            UIApplication.shared.statusBarOrientation
            == .landscapeRight) {
            //Increase number of sections in landscape mode
            noOfCellsInRow = 6
        }
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing
               * CGFloat(noOfCellsInRow - 1))
        let size = Int(
            (collectionView.bounds.width - totalSpace)
            / CGFloat(noOfCellsInRow)
        )
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let articleViewModel = ArticleViewModel(selectedSection: categorySection.sections[indexPath.row].title)
        let topStoriesViewController = self.storyboard?.instantiateViewController(withIdentifier: "TopStoriesViewController") as! TopStoriesViewController
        topStoriesViewController.articleViewModel = articleViewModel
        self.navigationController?.pushViewController(topStoriesViewController, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
}
