//
//  DetailImageView.swift
//  Paintings
//
//  Created by Khusain on 17.02.2024.
//

import SwiftUI

struct DetailImageView: View {
    let work: Work
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image(work.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    Text(work.info)
                        .padding()
                }
                
                .navigationTitle(work.title)
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.blue)
                        }
                        
                    }
                }
            }
        }
        
    }
}

#Preview {
    ImageDetailsView()
}
