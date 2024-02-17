//
//  ArtistsView.swift
//  Paintings
//
//  Created by Khusain on 17.02.2024.
//

import SwiftUI

struct ArtistsView: View {
    @ObservedObject var vm = ArtistsViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.artists, id: \.id) { artist in
                NavigationLink {
                    ArtistDetailsView(artist: artist)
                } label: {
                    VStack(alignment: .leading) {
                        Text(artist.name)
                            .font(.title2)
                            .foregroundStyle(.white)
                        
                        Image(artist.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(.rect(cornerRadius: 10))

                        Text(artist.bio)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .lineLimit(vm.showingBio[artist.id, default: false] ? nil : 2)
                            .animation(.default, value: vm.showingBio[artist.id, default: false])
                            
                        
                        Button {
                            vm.toggleBio(for: artist.id)
                        } label: {
                            Text(!(vm.showingBio[artist.id] ?? false) ? "Read more" : "Hide")
                                .foregroundStyle(.blue)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 15))
                .buttonStyle(.plain)
            }
            .toolbarBackground(Color.pink, for: .navigationBar)
            .toolbarBackground(.automatic, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .background(content: {
                LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            })
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationTitle("Artists")
        }
    }
}

#Preview {
    ArtistsView()
}
