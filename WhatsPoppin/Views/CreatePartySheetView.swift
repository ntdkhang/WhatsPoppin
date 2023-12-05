//
//  CreatePartySheetView.swift
//  WhatsPoppin
//
//  Created by Khang Nguyen on 12/4/23.
//

import SwiftUI

struct CreatePartySheetView: View {
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
                        displayedComponents: [.date, .hourAndMinute]
                    )
                    .datePickerStyle(.graphical)
            }
            
            Button("Create") {
                partyVM.addParty(Party(name: name, imageURLString: Party.getRandomURL(), price: price ?? 0, startDate: startDate))
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

