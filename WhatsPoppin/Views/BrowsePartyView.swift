//
//  BrowsePartyView.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import SwiftUI

struct BrowsePartyView: View {
    @ObservedObject var partyVM: PartyViewModel = PartyViewModel()
    @State var search: String = ""
    @State var showCreateSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(filteredParties) { party in
                        PartyCardView(party: party)
                            .padding()
                    }
                }
            }
            .background {
                backgroundGradient
                    .ignoresSafeArea()
            }
            .sheet(isPresented: $showCreateSheet) {
                CreatePartySheetView(partyVM: partyVM)
            }
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showCreateSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .searchable(text: $search)
    }
    
    var filteredParties: [Party] {
        if search.isEmpty {
            return partyVM.parties
        }
        return partyVM.parties.filter { $0.name.contains(search) }
    }

    
    var backgroundGradient: LinearGradient {
            LinearGradient(colors: [.BGPink, .BGPurple, .BGPurple, .BGPink],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

#Preview {
    BrowsePartyView()
}
