//
//  HexagonButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct PolygonsPentagonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .scaleEffect(configuration.isPressed ? 0.8: 1)
            .rotationEffect(configuration.isPressed ? .degrees(-100) : .degrees(0))
    }
}

struct PentagonButton: View {
    var body: some View {
        HStack {
            Text("Pentagon with rotatation")
                .foregroundColor(.black)
            Spacer()
            Button {

            } label: {
                Polygon(sides: 5)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 60, height: 60)
            }.buttonStyle(PolygonsHexagonButtonStyle())
        }
    }
}

