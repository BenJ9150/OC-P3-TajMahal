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
            ForEach(viewModel.meals) { meal in
                Section(header: Text(meal.mealType)) {
                    ForEach(meal.dishs) { dish in
                        ZStack(alignment: .leading) {
                            NavigationLink {
                                DishDetailView()
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
                .padding(.bottom, 12)
            }
        }
        .listRowSeparator(.hidden)
        .listRowSpacing(12)
        .navigationTitle("Menu")
    }
}

// MARK: Section title

extension MenuView {

    // Titre de la liste
    private struct SectionTileView: View {
        let title: String

        var body: some View {
            Text(title)
                .font(.jakarta_bold_14)
                .foregroundStyle(Color("color_text"))
                .frame(alignment: .leading)
                .padding(.top, 24)
                .padding(.bottom, 12)
        }
    }
}

// MARK: Menu row

extension MenuView {

    // Modèle d'une ligne de la liste des plats
    private struct MenuRowView: View {
        let dish: Dish

        var body: some View {
            HStack {
                Image(dish.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 112, height: 86)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.trailing, 25)
                VStack(alignment: .leading) {
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
                        Text("5,50€")
                            .font(.jakarta_semibold_12)
                            .foregroundStyle(Color("color_text"))
                        Spacer()
                        Image("ic_pepper_active")
                        Image(dish.spiceLevel == .medium || dish.spiceLevel == .hot ? "ic_pepper_active" : "ic_pepper_inactive")
                        Image(dish.spiceLevel == .hot ? "ic_pepper_active" : "ic_pepper_inactive")
                    }
                }
            }
        }
    }
}

// MARK: preview

#Preview {
    MenuView()
}
