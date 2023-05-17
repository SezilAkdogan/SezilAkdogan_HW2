//
//  UITableViewCell+Extension.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 13.05.2023.
//

import UIKit

extension UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    class func getNib() -> UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
}
