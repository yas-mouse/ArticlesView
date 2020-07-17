//
//  String+extension.swift
//  ArticlesView
//
//  Created by yas on 2020/07/15.
//  Copyright © 2020 yas. All rights reserved.
//

import Foundation

extension String {
    func dateFromString() -> Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: self)
    }
}
