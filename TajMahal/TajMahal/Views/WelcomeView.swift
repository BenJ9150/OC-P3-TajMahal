//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Page d'accueil
struct WelcomeView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                restaurantImageView
                restaurantBannerView
                restaurantInfoView
                Spacer()
                NavigationLink {
                    MenuView()
                } label : {
                    showMenuBtnView
                }
            }
            .padding(20)
        }
    }
}

// MARK: Restaurant image

extension WelcomeView {

    // Image du restaurant
    private var restaurantImageView: some View {
        Image("TajMahal")
            .resizable()
            .scaledToFit()
    }
}

// MARK: Restaurant banner

extension WelcomeView {

    // Bannière du restaurant avec logo
    private var restaurantBannerView: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text("Restaurant Indien")
                    .font(.jakarta_regular_12)
                    .foregroundStyle(Color("color_text"))
                    .padding(.bottom, 2)
                Text("Taj Mahal")
                    .font(.jakarta_bold_18)
                    .foregroundStyle(Color("color_title"))
            })
            Spacer()
            Image("ic_logo_gray")
                .frame(width: 40, height: 40)
        }
        .padding(.top, 20)
        .padding(.bottom, 20)
    }
}

// MARK: Informations

extension WelcomeView {

    // Informations sur le restaurant
    private var restaurantInfoView: some View {
        VStack {
            InfoRowView(icon: "ic_clock", primaryInfo: "Mardi", secondaryInfo: "11h30 - 14h30・18h30 - 22h00")
            InfoRowView(icon: "ic_service", primaryInfo: "Type de Service", secondaryInfo: "À emporter")
            InfoRowView(icon: "ic_localization", primaryInfo: "12  Avenue de la Brique - 75010 Paris")
            InfoRowView(icon: "ic_webSite", primaryInfo: "www.tajmahal.fr")
            InfoRowView(icon: "ic_phone", primaryInfo: "06 12 34 56 78")
        }
    }

    // Modèle d'une information à afficher
    private struct InfoRowView: View {
        let icon: String
        let primaryInfo: String
        var secondaryInfo: String = ""

        var body: some View {
            HStack {
                Image(icon)
                Text(primaryInfo)
                    .font(.jakarta_semibold_12)
                    .foregroundStyle(Color("color_text"))
                Spacer()
                Text(secondaryInfo)
                    .font(.jakarta_semibold_12)
                    .foregroundStyle(Color("color_text"))
            }
            .padding(.bottom, 14)
        }
    }
}

// MARK: Button

extension WelcomeView {

    // Bouton "Accéder au menu"
    private var showMenuBtnView: some View {
        Text("Accéder au menu")
            .foregroundStyle(.white)
            .font(.jakarta_bold_16)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Color("CustomRed"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: preview

#Preview {
    WelcomeView()
}
