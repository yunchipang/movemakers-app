//
//  DancerDetail.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct DancerDetail: View {
    @ObservedObject var viewModel: DancerDetailViewModel

    init(dancer: Dancer) {
        self.viewModel = DancerDetailViewModel(dancer: dancer)
    }

    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: viewModel.dancer.imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .padding(.top, 130)
            .offset(y: -130)
            .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.dancer.name)
                        .font(.title)
                }
                
                // horizontal scroll for crews
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.crews, id: \.id) { crew in
                            let url = URL(string: "https://instagram.com/\(crew.instagram)")
                            if !crew.instagram.isEmpty {
                                TagView(text: crew.name, backgroundColor: .gray, textColor: .white, url: url)
                                    .padding(.trailing, 10)
                            } else {
                                TagView(text: crew.name, backgroundColor: .gray, textColor: .white)
                                    .padding(.trailing, 10)
                            }
                        }
                    }
                }
                
                if let agency = viewModel.dancer.agency, !agency.isEmpty {
                    TagView(text: agency, backgroundColor: .pink, textColor: .white)
                        .padding(.bottom, 1)
                }

                Divider()
                
                Text(viewModel.dancer.bio ?? "No biography available")
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
