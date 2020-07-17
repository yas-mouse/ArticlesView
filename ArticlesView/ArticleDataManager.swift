//
//  ArticleDataManager.swift
//  ArticlesView
//
//  Created by yas on 2020/07/15.
//  Copyright © 2020 yas. All rights reserved.
//

import Alamofire
import Foundation

class ArticleDataManager: ObservableObject {
    @Published var articles: [Article] = []

    private let baseUrl: String = "https://qiita.com/api/v2/items"
    var pages: Int = 1

    init() {
        load()
    }

    private func load() {

        let params: Parameters = [
            "pages": pages,
            "per_page": 20
        ]

        if let url = URL(string: baseUrl) {
            AF.request(url, method: .get, parameters: params).responseJSON { response in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        return
                    }

                    let decoder: JSONDecoder = JSONDecoder()
                    guard let decoded = try? decoder.decode([Article].self, from: data) else {
                        return
                    }

                    self.articles += decoded

                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
