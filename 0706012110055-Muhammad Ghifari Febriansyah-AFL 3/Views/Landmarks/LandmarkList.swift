//
//  LandmarkList.swift
//  0706012110055-Muhammad Ghifari Febriansyah-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

//Making list for landmark
struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    //showing each landmark in the landmarkdata
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    var title: String {
          let title = filter == .all ? "Landmarks" : filter.rawValue
          return showFavoritesOnly ? "Favorite \(title)" : title
      }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        NavigationView {
            //List view
            List(selection: $selectedLandmark) {
                //toggling on show favorites only
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                //put navigation in each landmark
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            //setting title for list
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                    Text(category.rawValue).tag(category)
                                        }
                                }
                    .pickerStyle(.inline)

                    Toggle(isOn: $showFavoritesOnly) {
                    Label("Favorites only", systemImage: "star.fill")
                                              }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                        }
                    }
               }
            Text("Select a Landmark")
            }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
        }
    }

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

