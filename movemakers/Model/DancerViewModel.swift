//
//  ModelData.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/8/24.
//

import Foundation
import Combine

class DancerViewModel: ObservableObject {
    @Published var dancers: [Dancer] = []

    func loadDancers() {
        APIService.shared.fetchData(from: "http://localhost:8000/dancers/") { [weak self] (result: Result<[Dancer], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let dancers):
                    self?.dancers = dancers
                case .failure(let error):
                    print("Error loading dancers: \(error)")
                }
            }
        }
    }
}

