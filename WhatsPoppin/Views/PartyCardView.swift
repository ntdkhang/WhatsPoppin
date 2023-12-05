//
//  PartyCardView.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import SwiftUI

struct PartyCardView: View {
    var party: Party
    
    var body: some View {
        ZStack {
            VStack {
                // MARK: Image
                AsyncImage(url: URL(string: party.imageURLString)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(roundedRect)
                } placeholder: {
                    ProgressView()
                }
                
                // MARK: Time
                HStack {
                    Image(systemName: "calendar")
                    Group {
                        Text(party.startDate, style: .date)
                        Text(party.startDate, style: .time)
                        if (party.endDate != nil) {
                            Text("-")
                            Text(party.endDate!, style: .time)
                        }
                    }
                    .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
                
                // MARK: Price
                HStack {
                    Text(priceString)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 8)
                
                
                // MARK: Name
                Text(party.name)
                    .font(.title.bold())
            }
            .padding(4)
            .background {
                Color.black.opacity(0.3)
                    .blur(radius: 8)
                    .clipShape(roundedRect)
            }
        }
    }
    
    var priceString: String {
        if (party.price == 0) {
            return "Free"
        }
        return String(format: "$ %.2f", party.price)
    }
    
    var roundedRect: RoundedRectangle {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .circular)
    }
}
