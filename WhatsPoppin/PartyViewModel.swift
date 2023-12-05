//
//  PartyViewModel.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import Foundation

class PartyViewModel: ObservableObject {
    @Published var parties: [Party]
    
    init() {
        // Requirement 2: Generate at least 3 random parties
        parties = []
        for _ in 0...4 {
            let urlString = Party.urls[Int.random(in: 0..<Party.urls.count)]
            let isFree: Bool = Int.random(in: 0...1) == 0 ? true : false
            let price: Double = isFree ? 0.0 : Double.random(in: 5.0...100.0)
            let startDate: Date = Date.init(timeInterval: Double.random(in: 10000...100000), since: .now)
            let endDate: Date? = Int.random(in: 0...1) == 0 ? nil : Date.init(timeInterval: 10800, since: startDate)
            let party = Party(name: "TEMP NAME",
                              imageURLString: urlString,
                              price: price,
                              startDate: startDate,
                              endDate: endDate)
            parties.append(party)
        }
    }
}

