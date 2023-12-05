//
//  BrowsePartyView.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import SwiftUI

struct BrowsePartyView: View {
    @ObservedObject var partyVM: PartyViewModel = PartyViewModel()
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    ForEach(partyVM.parties) { party in
                        PartyCardView(party: party)
                            .padding()
                    }
                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
    
    var backgroundGradient: LinearGradient {
            LinearGradient(colors: [.BGPink, .BGPurple, .BGPurple, .BGPink],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct PartyCardView: View {
    var party: Party
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: party.imageURLString)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(roundedRect)
                } placeholder: {
                    ProgressView()
                }
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
                Text(party.name)
                    .font(.title.bold())
            }
            .padding(4)
            .background {
                Color.black.opacity(0.3)
                    .blur(radius: 8)
                    .clipShape(roundedRect)
            }
            
            VStack(alignment: .leading) {
                Text("Hello")
            }
        }
    }
    
    var roundedRect: RoundedRectangle {
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .circular)
    }
}


#Preview {
    BrowsePartyView()
}
