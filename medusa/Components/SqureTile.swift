//
//  SqureTile.swift
//  medusa
//
//  Created by Zheer Barzan on 24/12/24.
//
import SwiftUI

struct SquareTile: View {
    let imagePath: String
    @State var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            Image(imagePath)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.secondarySystemBackground)
                )
                    )
        }
        .buttonStyle(PlainButtonStyle()) // Removes default button styling
    }
}

