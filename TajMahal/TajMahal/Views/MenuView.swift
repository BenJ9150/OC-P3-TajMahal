//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {

    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let viewModel: ViewModel = ViewModel()
    
    var body: some View {
        List {
            // On affiche chaque section (entrées, plats)
            ForEach(viewModel.meals) { meal in
                Section(header: Text(meal.mealType).padding(.bottom, 12)) {
                    // On affiche chaque plat de la section
                    ForEach(meal.dishs) { dish in
                        ZStack(alignment: .leading) {
                            NavigationLink {
                                DishDetailView(dish: dish)
                            } label : {
                                EmptyView()
                            }
                            .opacity(0)
                            MenuRowView(dish: dish)
                        }
                    }
                }
                .textCase(nil)
                .font(.jakarta_bold_14)
                .foregroundStyle(Color("color_text"))
            }
        }
        .listRowSeparator(.hidden)
        .listRowSpacing(12)
        .navigationTitle("Menu")
    }
}

// MARK: Menu row

extension MenuView {

    // Modèle d'une ligne de la liste des plats
    private struct MenuRowView: View {
        // le plat à afficher
        let dish: Dish
        // l'image du plat
        @State private var dishImage: UIImage?

        var body: some View {
            HStack(spacing: 25) {
                if let uiImage = dishImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 112, height: 86)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    // Image non chargée, on affiche une progress view
                    ProgressView()
                        .frame(width: 112, height: 86)
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text(dish.name)
                        .font(.jakarta_semibold_14)
                        .foregroundStyle(Color("color_text"))
                        .padding(.bottom, 8)
                    Text(dish.description)
                        .font(.jakarta_regular_12)
                        .foregroundStyle(Color("color_text"))
                        .lineLimit(2)
                        .padding(.bottom, 12)
                    HStack {
                        Text(priceToString(price: dish.price))
                            .font(.jakarta_semibold_12)
                            .foregroundStyle(Color("color_text"))
                        Spacer()
                        SpiceLevelView(spiceLevel: dish.spiceLevel)
                    }
                }
            }
            .task {
                // Chargement de l'image en async
                // Fait car les images sont très grosses !
                Task.detached(priority: .background) {
                    dishImage = UIImage(named: dish.imageName)
                }
            }
        }

        // Formate le prix du plat
        private func priceToString(price: Float) -> String {
            return String(format: "%.2f€", price).replacingOccurrences(of: ".", with: ",")
        }
    }
}

// MARK: preview

#Preview {
    MenuView()
}

