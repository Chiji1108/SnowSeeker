//
//  ContentView.swift
//  SnowSeeker
//
//  Created by 千々岩真吾 on 2025/03/14.
//

import SwiftUI

enum SortType {
    case `default`, alphabetical, country
}

struct ContentView: View {

    @State private var searchText = ""
    @State private var sortType = SortType.default

    let resorts: [Resort] = Bundle.main.decode("resorts.json")

    var filteredResorts: [Resort] {
        let filtered =
            searchText.isEmpty
            ? resorts : resorts.filter { $0.name.localizedStandardContains(searchText) }

        return switch sortType {
        case .default:
            filtered
        case .alphabetical:
            filtered.sorted { $0.name < $1.name }
        case .country:
            filtered.sorted { $0.country < $1.country }
        }
    }

    @State private var favorites = Favorites()

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(filteredResorts) { resort in
                    NavigationLink(value: resort) {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 25)
                                .clipShape(
                                    .rect(cornerRadius: 5)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(resort.name)
                                    .font(.headline)
                                Text("\(resort.runs) runs")
                                    .foregroundStyle(.secondary)
                            }

                            if favorites.contains(resort) {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibilityLabel("This is a favorite resort")
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Menu {
                    Picker("Sort by", selection: $sortType) {
                        Text("Default").tag(SortType.default)
                        Text("A-Z").tag(SortType.alphabetical)
                        Text("Country").tag(SortType.country)
                    }
                } label: {
                    Label("Sort", systemImage: "arrow.up.arrow.down")
                }
            }
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
