//
//  ContentView.swift
//  ArticlesView
//
//  Created by yas on 2020/07/13.
//  Copyright © 2020 yas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var articleDataManager = ArticleDataManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(articleDataManager.articles) { article in
                    NavigationLink(destination: DetailView(article: article)) {
                        ArticleCell(article: article)
                    }
                }
            }
            .navigationBarTitle(Text("Qiita"), displayMode: .inline)
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
