//
//  DishDetailView.swift
//  TajMahal
//
//  Created by Benjamin LEFRANCOIS on 28/12/2023.
//

import SwiftUI

struct DishDetailView: View {
    let dish: Dish

    var body: some View {
        VStack(alignment: .leading) {
            DishImageView(dish: dish)
            DishInfoView(dish: dish)
            Spacer()
        }
        .navigationTitle(dish.name)
        .padding(20)
    }
}

// MARK: Image

extension DishDetailView {

    // Affiche l'image et le niveau de piment
    private struct DishImageView: View {
        let dish: Dish

        var body: some View {
            ZStack(alignment: .topTrailing) {
                BigImageView(imageName: dish.imageName)
                SpiceLevelView(spiceLevel: dish.spiceLevel)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .padding(.top, 4)
                    .padding(.bottom, 4)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: .infinity))
                    .padding(.top, 12)
                    .padding(.trailing, 12)
            }
            .padding(.bottom, 32)
        }
    }
}

// MARK: Informations

extension DishDetailView {

    // Informations sur le plat
    private struct DishInfoView: View {
        let dish: Dish

        var body: some View {
            VStack(alignment: .leading, spacing: 15) {
                // allergènes
                InfoRowView(title: "Allergènes", text: dish.allergens)
                // séparation
                Rectangle()
                    .frame(height: 0.75)
                    .foregroundStyle(Color("color_stroke"))
                // ingrédients
                InfoRowView(title: "Ingrédients", text: dish.ingredients)
            }
        }
    }

    // Modèle d'une information à afficher
    private struct InfoRowView: View {
        let title: String
        let text: String

        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Text(title + " :")
                    .font(.jakarta_semibold_12)
                    .foregroundStyle(Color("color_text"))
                Text(text)
                    .font(.jakarta_regular_12)
                    .foregroundStyle(Color("color_text"))
            }
        }
    }
}

// MARK: preview

#Preview {
    DishDetailView(dish: ViewModel().mainCourseArray.first!)
}
