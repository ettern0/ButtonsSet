//
//  HexagonButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct PolygonsHexagonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .scaleEffect(configuration.isPressed ? 0.8: 1)
            .rotationEffect(configuration.isPressed ? .degrees(-60) : .degrees(0))
    }
}

struct HexagonButton: View {
    var body: some View {
        HStack {
            Text("Hexagon with rotatation (haptic)")
                .foregroundColor(.black)
            Spacer()
            Button {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            } label: {
                Polygon(sides: 6)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 60, height: 60)
            }.buttonStyle(PolygonsHexagonButtonStyle())
        }
    }
}
