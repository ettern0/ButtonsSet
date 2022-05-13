//
//  IconButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct IconButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .background(.gray.opacity(0.1))
            .foregroundColor(.black)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 0.8: 1)
    }
}

struct XMarkIconButton: View {
    var body: some View {
        HStack {
            Text("xmark")
                .foregroundColor(.black)
            Spacer()
            Button {
            } label: {
                Image(systemName: "xmark")
            }.buttonStyle(IconButton())
        }
        .padding()
    }
}

struct XMarkIconHapticButton: View {
    var body: some View {
        HStack {
            Text("xmark with haptic")
                .foregroundColor(.black)
            Spacer()
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                impactMed.impactOccurred()
            } label: {
                Image(systemName: "xmark")
            }.buttonStyle(IconButton())
        }
        .padding()
    }
}
