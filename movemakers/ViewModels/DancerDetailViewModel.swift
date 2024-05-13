//
//  DancerDetailViewModel.swift
//  movemakers
//
//  Created by Yunchi Pang on 5/13/24.
//

import Foundation

class DancerDetailViewModel: ObservableObject {
    @Published var dancer: Dancer
    @Published var crews: [Crew] = []

    init(dancer: Dancer) {
        self.dancer = dancer
        fetchCrewsForDancer(dancerId: dancer.id)
        
        // todo: fetch studios where the dancer teaches at
    }

    func fetchCrewsForDancer(dancerId: String) {
        APIService.shared.fetchData(from: "http://localhost:8000/crews/?dancer_id=\(dancerId)") { [weak self] (result: Result<[Crew], Error>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let crews):
                    self?.crews = crews
                case .failure(let error):
                    print("Error loading crews: \(error)")
                }
            }
        }
    }
}
