//
//  ParalaxMotionModifier.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI
import CoreMotion

struct ParallaxMotionModifier: ViewModifier {

    @ObservedObject var manager: MotionManager
    var magnitude: Double
    var additionalOffset: Double = 1

    func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(manager.roll * magnitude * additionalOffset), y: CGFloat(manager.pitch * magnitude * additionalOffset))
    }
}

