//
//  NSObject+Extension.swift
//  Sezil_HW2News
//
//  Created by Sezil Akdoğan on 17.05.2023.
//

import Foundation

extension NSObject {
    public var className: String {
        return type(of: self).className
    }
    
    public static var className: String {
        return String(describing: self)
    }
}
