//
//  SettingsView.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 28/08/2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var spotUrlsObserv: SurfSpotUrlsObserv
    @State private var itemToAdd = ""
    @State private var isAddingItem = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            VStack(alignment: .leading, spacing: 8.0) {
                Text("Surf Spot URL's")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading) {
                    Text("Must be from Surfline.")
                    .font(.subheadline)
                    Text("Allowed up-to six.")
                    .font(.subheadline)
                    Text("Recommended to order in priority.")
                    .font(.subheadline)
                    Text("Drag list item to move.")
                    .font(.subheadline)
                    Text("Right click item to delete.")
                    .font(.subheadline)
                }
            }
            List {
                ForEach(spotUrlsObserv.surfSpotUrls, id: \.self) { url in
                    Text("\(url)")
                    .contextMenu {
                        Button(action: {
                            spotUrlsObserv.surfSpotUrls = spotUrlsObserv.surfSpotUrls.filter {
                                $0 != url
                            }
                        }){
                            Text("Delete")
                        }
                    }
                }
                .onMove(perform: { indices, newOffset in
                    spotUrlsObserv.surfSpotUrls.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            if isAddingItem {
                Form {
                    VStack {
                        TextField("SurfLine URL:", text: $itemToAdd)
                        HStack{
                            Spacer()
                            HStack {
                                Button(action: {
                                    isAddingItem = false
                                }) {
                                    Text("Cancel")
                                }
                                Button(action: {
                                    AddItem()
                                }) {
                                    Text("Add")
                                }
                            }
                        }
                    }
                }
                .frame(height: 100)
            }
            else {
                HStack{
                    Spacer()
                    Button(action: {
                        isAddingItem = true
                    }) {
                        Image(systemName: "plus")
                        .padding(4)
                    }
                    .disabled(spotUrlsObserv.surfSpotUrls.count >= 6)
                }
            }
        }
        .padding(.all, 10.0)
        .frame(minWidth: 600, maxWidth: 650, minHeight: 400, maxHeight: 500)
    }
    
    func AddItem() {
        if itemToAdd != "" {
            spotUrlsObserv.surfSpotUrls.append(itemToAdd)
            itemToAdd = ""
        }
        isAddingItem = false
    }
}
