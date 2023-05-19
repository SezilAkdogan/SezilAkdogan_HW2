//
//  CategorySectionViewController.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//


import UIKit

class CategorySectionViewController: UIViewController {

    var viewModel: CategorySectionViewModel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        viewModel.fetchPosts()
    }

    private func setupViewModel() {
        viewModel = CategorySectionViewModel()
        viewModel.delegate = self
    }

}

extension CategorySectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //MARK: - CollectionView Delegates and DataSources
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfSections
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CategorySectionCollectionViewCell
        cell.configure(with: viewModel.getSection(at: indexPath.row))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = UIDevice.current.orientation.isLandscape ? 6 : 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing
               * CGFloat(noOfCellsInRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedSection = viewModel.getSection(at: indexPath.row)
        let topStoriesViewModel = TopStoriesViewModel(selectedSection: selectedSection.title)
        let topStoriesViewController = storyboard?.instantiateViewController(withIdentifier: "TopStoriesViewController") as! TopStoriesViewController
        topStoriesViewController.topStoriesViewModel = topStoriesViewModel
        navigationController?.pushViewController(topStoriesViewController, animated: true)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.reloadData()
    }
}

extension CategorySectionViewController: CategorySectionViewModelDelegate {
    func sectionsFetched() {
        collectionView.reloadData()
    }
}
