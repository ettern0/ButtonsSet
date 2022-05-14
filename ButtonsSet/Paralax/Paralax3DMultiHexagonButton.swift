//
//  Paralax3DMultiHexagonButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI

struct Parallax3DMultiHexagotButton: View {

    @ObservedObject var manager = MotionManager()
    @State var effect = false

    var body: some View {
        HStack {
            Text("Paralax 3D Hexagon")
            Spacer()
            Button {
                withAnimation {
                    effect.toggle()
                }
            } label: {
                multiHexagon
                    .blur(radius: 10)
                    .opacity(0.9)
                    .frame(width: 120)
                    .overlay {
                        multiHexagon
                            .modifier(ParallaxMotionModifier(manager: manager, magnitude: 10, additionalOffset: 2))
                    }
            }
        }
    }

    var multiHexagon: some View {
        ZStack {
            Polygon(sides: 6)
                .foregroundColor(Color.red)
                .frame(width: 100, height: 100)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 10))
                .rotationEffect(effect ? .degrees(-20) : .degrees(0))
            Polygon(sides: 6)
                .foregroundColor(Color.green)
                .frame(width: 80, height: 80)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 14))
                .rotationEffect(effect ? .degrees(20) : .degrees(0))
            Polygon(sides: 6)
                .foregroundColor(Color.blue)
                .frame(width: 60, height: 60)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 16))
                .rotationEffect(effect ? .degrees(-20) : .degrees(0))
            Polygon(sides: 6)
                .foregroundColor(Color.yellow)
                .frame(width: 40, height: 40)
                .modifier(ParallaxMotionModifier(manager: manager, magnitude: 18))
                .rotationEffect(effect ? .degrees(20) : .degrees(0))
        }
    }
}
