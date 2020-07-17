//
//  LgtmText.swift
//  ArticlesView
//
//  Created by yas on 2020/07/17.
//  Copyright © 2020 yas. All rights reserved.
//

import SwiftUI

struct LgtmText: View {
    var lgtmCount: Int
    var body: some View {
        Text("LGTM \(lgtmCount)")
            .font(.headline)
            .padding(.all, 4.0)
            .foregroundColor(.green)
            .overlay(Rectangle().stroke(Color.green, lineWidth: 2))

    }
}

struct LgtmText_Previews: PreviewProvider {
    static var previews: some View {
        LgtmText(lgtmCount: 100)
    }
}
