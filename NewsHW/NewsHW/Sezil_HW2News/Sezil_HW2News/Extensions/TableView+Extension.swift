//
//  TableView+Extension.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import Foundation
import UIKit
import NewsAPI

extension UITableView{

    func register(cellType: UITableViewCell.Type) {
      //  register(cellType.nib, forCellWithReuseIdentifier: cellType.identifier)
    }

    func dequeCell<T: UITableViewCell>(cellType: T.Type, indexPath: IndexPath) -> T {
        guard let cell =
                dequeueReusableCell(
                    withIdentifier: cellType.identifier,
                    for: indexPath) as? T else {
            fatalError("Error!")
        }

        return cell
    }

}

