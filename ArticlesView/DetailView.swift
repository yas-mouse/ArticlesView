//
//  DetailView.swift
//  ArticlesView
//
//  Created by yas on 2020/07/15.
//  Copyright © 2020 yas. All rights reserved.
//

import AlamofireImage
import SwiftUI

struct DetailView: View {
    var article: Article
    private let imageDownloader = ImageDownloader()
    @State private var image = UIImage()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // 著者情報
                HStack {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .clipShape(Circle())
                        .shadow(radius: 20)
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
                    Text("by \(article.user.name)").font(.body)
                }

                // 更新日時
                Text("\(article.formattedUpdatedAt())に更新")
                    .font(.body)
                    .padding(.bottom, 8.0)

                // タイトル
                Text(article.title).font(.largeTitle)
                    .padding(.bottom, 8.0)

                // タグ
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(article.tags, id: \.self) { tag in
                            Button(action: {
                                print("tapped")
                            }, label: {
                                Text(tag.name)
                                    .padding(.all, 4.0)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Capsule())
                            })
                        }
                        Spacer()
                    }
                }.padding(.bottom, 8.0)

                // LGTM
                LgtmText(lgtmCount: article.likes_count)
                    .padding(.bottom, 8.0)

                // 本文
                Text(article.body).padding()
            }.padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(article: articleData[0])
    }
}
