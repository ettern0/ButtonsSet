//
//  InfinityWidthBatton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct InfinityWidthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .scaleEffect(configuration.isPressed ? 0.97: 1)
    }
}


struct InfinityWidthButton: View {
    var body: some View {
        Button {

        } label: {
            Text("Infinity width button")
        }
        .buttonStyle(InfinityWidthButtonStyle())
    }
}

struct InfinityWidthHapticButton: View {
    var body: some View {
        Button {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        } label: {
            Text("Infinity width button (haptic)")
        }
        .buttonStyle(InfinityWidthButtonStyle())
    }
}
