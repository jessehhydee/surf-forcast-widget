//
//  SettingsView.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 28/08/2024.
//

import SwiftUI

struct SettingsView: View {
    @State private var surfSpotUrls = UserDefaults.standard.array(forKey: "surfSpotUrls") ?? []
//    @AppStorage("surfSpotUrls") private var surfSpotUrls: [String] = []
    @State private var itemToAdd = ""
    @State private var isAddingItem = false

    var body: some View {
        VStack {
            List {
                ForEach(surfSpotUrls as! [String], id: \.self) { url in
                    Text("\(url)")
                }
            }
            if isAddingItem {
                Form {
                    Section(header: Text("Item to Add")) {
                        HStack {
                            TextField("Key in value", text: $itemToAdd)
                            Button(action: {
                                addItem()
                            }) {
                                Text("Done")
                            }
                        }
                    }
                }
                .frame(height: 100)
            }
            Button(action: {
                isAddingItem = true
            }) {
                Image(systemName: "plus")
                .padding(5)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    func addItem() {
        if itemToAdd != "" {
            surfSpotUrls.append(itemToAdd)
            UserDefaults.standard.set(surfSpotUrls, forKey: "surfSpotUrls")
            itemToAdd = ""
        }
        isAddingItem = false
    }
}
