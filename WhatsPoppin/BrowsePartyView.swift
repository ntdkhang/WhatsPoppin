//
//  BrowsePartyView.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import SwiftUI

struct BrowsePartyView: View {
    @ObservedObject var partyVM: PartyViewModel = PartyViewModel()
    
    @State var showCreateSheet: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(partyVM.parties) { party in
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
                CreateSheetView(partyVM: partyVM)
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
    }
    
    var filteredParties: [Party] {
        
    }

    
    var backgroundGradient: LinearGradient {
            LinearGradient(colors: [.BGPink, .BGPurple, .BGPurple, .BGPink],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct CreateSheetView: View {
    var partyVM: PartyViewModel
    @State private var name: String = ""
    @State private var price: Double?
    @State private var startDate: Date = .now
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                TextField("Party Name", text: $name)
                TextField("Price", value: $price, formatter: formatter)
                DatePicker(
                        "Start Date",
                        selection: $startDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
            }
            
            Button("Create") {
                partyVM.addParty(Party(name: name, imageURLString: Party.urls[0], price: price ?? 0, startDate: startDate))
                dismiss.callAsFunction()
            }
        }
    }
    
    let formatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
}

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


#Preview {
    BrowsePartyView()
}
