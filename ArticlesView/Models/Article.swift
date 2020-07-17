//
//  Article.swift
//  ArticlesView
//
//  Created by yas on 2020/07/15.
//  Copyright © 2020 yas. All rights reserved.
//

import SwiftUI

struct Article: Hashable, Codable, Identifiable {
    var id: String
    var title: String
    var body: String
    var created_at: String
    var updated_at: String
    var likes_count: Int
    var user: User
    var tags: [Tag]

    func formattedCreatedAt() -> String {
        return self.created_at.dateFromString()?.formattedDate(timeStyle: .none, dateStyle: .medium) ?? ""
    }

    func formattedUpdatedAt() -> String {
        return self.updated_at.dateFromString()?.formattedDate(timeStyle: .none, dateStyle: .medium) ?? ""
    }
}

struct User: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var profile_image_url: String
}

struct Tag: Hashable, Codable {
    var name: String
}
