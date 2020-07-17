//
//  ArticleCell.swift
//  ArticlesView
//
//  Created by yas on 2020/07/15.
//  Copyright © 2020 yas. All rights reserved.
//

import AlamofireImage
import SwiftUI

struct ArticleCell: View {
    @State private var image = UIImage()
    let imageDownloader = ImageDownloader()
    var article: Article

    var body: some View {
        HStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: 70.0, height: 70.0)
                .clipShape(Circle())
                .shadow(radius: 5)
                .onAppear {
                    if let url = URL(string: self.article.user.profile_image_url) {
                        let urlRequest = URLRequest(url: url)
                        self.imageDownloader.download(urlRequest) { response in
                            if case .success(let image) = response.result {
                                self.image = image
                            }
                        }
                    }
                }
            VStack(alignment: .leading) {
                Text(article.title).font(.headline)
                    .padding(.bottom, 8.0)

                HStack {
                    Text("by \(article.user.name)")
                        .font(.body)
                    Text(article.formattedCreatedAt())
                        .font(.body)
                }

                Text("LGTM \(article.likes_count)")
                    .font(.body)
            }
        }
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: articleData[0])
    }
}
