//
//  ParalaxButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI
import CoreMotion

struct ParallaxMotionModifier: ViewModifier {

    @ObservedObject var manager: MotionManager
    var magnitude: Double

    func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(manager.roll * magnitude), y: CGFloat(manager.pitch * magnitude))
    }
}

class MotionManager: ObservableObject {

    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0

    private var manager: CMMotionManager

    init() {
        self.manager = CMMotionManager()
        self.manager.deviceMotionUpdateInterval = 1/60
        self.manager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
            }
        }

    }
}

struct ParallaxMultiHexagotButton: View {

    @ObservedObject var manager = MotionManager()
    @State var rotation = false

    var body: some View {
        HStack {
            Text("Paralax 3D Hexagon")
            Spacer()
            ZStack {
                Group {
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
                .onTapGesture {
                    withAnimation {
                    rotation.toggle()
                    }
                }
            }
        }

    }
}
