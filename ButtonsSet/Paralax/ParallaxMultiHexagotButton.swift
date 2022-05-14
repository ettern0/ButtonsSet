//
//  ParalaxButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI

struct ParallaxMultiHexagotButton: View {

    @ObservedObject var manager = MotionManager()
    @State var rotation = false

    var body: some View {
        HStack {
            Text("Paralax Hexagon")
            Spacer()
            Button {
                withAnimation {
                rotation.toggle()
                }
            } label: {
                multiHexagon
            }
        }
    }

    var multiHexagon: some View {
        ZStack {
                Polygon(sides: 6)
                    .foregroundColor(Color.red)
                    .frame(width: 100, height: 100)
                    .modifier(ParallaxMotionModifier(manager: manager, magnitude: 10))
                    .rotationEffect(rotation ? .degrees(-20) : .degrees(0))
                Polygon(sides: 6)
                    .foregroundColor(Color.green)
                    .frame(width: 80, height: 80)
                    .modifier(ParallaxMotionModifier(manager: manager, magnitude: 14))
                    .rotationEffect(rotation ? .degrees(20) : .degrees(0))
                Polygon(sides: 6)
                    .foregroundColor(Color.blue)
                    .frame(width: 60, height: 60)
                    .modifier(ParallaxMotionModifier(manager: manager, magnitude: 16))
                    .rotationEffect(rotation ? .degrees(-20) : .degrees(0))
                Polygon(sides: 6)
                    .foregroundColor(Color.yellow)
                    .frame(width: 40, height: 40)
                    .modifier(ParallaxMotionModifier(manager: manager, magnitude: 18))
                    .rotationEffect(rotation ? .degrees(20) : .degrees(0))
        }
    }
}
