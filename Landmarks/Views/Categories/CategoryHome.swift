//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Egor Anoshin on 06.02.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI


struct CategoryHome: View {
    @Environment(ModelData.self) var modelData


    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())


                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environment(ModelData())
}

