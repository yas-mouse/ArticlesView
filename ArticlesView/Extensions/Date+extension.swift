//
//  Date+extension.swift
//  Sanpo
//
//  Created by yas on 2020/04/27.
//  Copyright © 2020 yas. All rights reserved.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: self)
    }

    func formattedDate(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: self)
    }

    func formattedDate(timeStyle: DateFormatter.Style, dateStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter.string(from: self)
    }
}
