//
//  ComponentsView.swift
//  TajMahal
//
//  Created by Benjamin LEFRANCOIS on 28/12/2023.
//

import SwiftUI

// Grande image avec arrondi
struct BigImageView: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity
            )
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// Affichage du niveau de piment
struct SpiceLevelView: View {
    let spiceLevel: SpiceLevel

    var body: some View {
        HStack(spacing: 4) {
            Image("ic_pepper_active")
            Image(spiceLevel == .medium || spiceLevel == .hot ? "ic_pepper_active" : "ic_pepper_inactive")
            Image(spiceLevel == .hot ? "ic_pepper_active" : "ic_pepper_inactive")
        }
    }
}
