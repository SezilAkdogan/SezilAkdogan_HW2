//
//  TableView+Extension.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit

extension UITableView{

    func registerWithNib(_ cells: UITableViewCell.Type...) {
        for cell in cells {
            self.register(cell.getNib(), forCellReuseIdentifier: cell.identifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as? T else {
            fatalError()
        }
        
        return cell
    }
}
