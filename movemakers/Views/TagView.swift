//
//  TagView.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/13/24.
//

import SwiftUI

struct TagView: View {
    var text: String
    var backgroundColor: Color = .gray
    var textColor: Color = .white
    var url: URL?

    var body: some View {
        Group {
            if let url = url {
                Link(destination: url) {
                    content
                }
            } else {
                content
            }
        }
    }
    
    private var content: some View {
        Text(text)
            .padding(8)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .font(.caption)
    }
}
