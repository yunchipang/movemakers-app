//
//  DancerDetail.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import SwiftUI

struct DancerDetail: View {
    @ObservedObject var viewModel: DancerViewModel
    var dancer: Dancer
    
    private var dancerIndex: Int {
        viewModel.dancers.firstIndex(where: { $0.id == dancer.id })!
    }
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: dancer.imageUrl)) { image in
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
                    Text(dancer.name)
                        .font(.title)
                }
                
                Divider()
                
                Text(dancer.bio ?? "No biography available")
            }
            .padding()
        }
        .navigationTitle(dancer.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
