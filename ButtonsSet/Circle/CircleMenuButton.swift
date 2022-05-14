//
//  CircleMenuButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI

struct CircleMenuButton: View {

    @Binding var isActive: Bool
    let radius = UIScreen.main.bounds.width / 2 * 0.8
    let xCenter = UIScreen.main.bounds.width / 2
    let yCenter = UIScreen.main.bounds.height / 2
    let yInit = 20.0

    var buttons: [MenuButton]  = [
        MenuButton(label: Image(systemName: "music.note"), action: {}),
        MenuButton(label: Image(systemName: "location.fill"), action: {}),
        MenuButton(label: Image(systemName: "camera.fill"), action: {}),
        MenuButton(label: Image(systemName: "quote.bubble.fill"), action: {}),
        MenuButton(label: Image(systemName: "moon.fill"), action: {}),
        MenuButton(label: Image(systemName: "plus"), action: {}),
        MenuButton(label: Image(systemName: "location.fill"), action: {}),
        MenuButton(label: Image(systemName: "camera.fill"), action: {}),
        MenuButton(label: Image(systemName: "quote.bubble.fill"), action: {}),
        MenuButton(label: Image(systemName: "moon.fill"), action: {}),
        MenuButton(label: Image(systemName: "camera.fill"), action: {}),
        MenuButton(label: Image(systemName: "quote.bubble.fill"), action: {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }),
    ]

    var body: some View {
        ZStack {
            //Main centered button
            Button {
                isActive.toggle()
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            } label: {
                Image(systemName: "plus")
                    .frame(width: 40, height: 40)
                    .background(.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }.position(x: xCenter, y: isActive  ? yCenter : yInit)
                ForEach(buttons.indices, id: \.self) { index in
                    let angle = Double(index * (360 / buttons.count))
                    let x = radius * cos(deg2rad(angle)) + xCenter
                    let y = radius * sin(deg2rad(angle)) + yCenter
                    let item = buttons[index]
                    MenuItemView(buttonLabel: AnyView(item.label), action: item.action)
                        .opacity(isActive ? 1 : 0)
                        .position(x: isActive ? x : xCenter, y: isActive ? y : yCenter)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75), value: isActive)
            }
        }
    }
}

