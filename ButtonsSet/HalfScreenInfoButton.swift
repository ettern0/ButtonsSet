//
//  HalfScreenInfoButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct HalfScreenInfoButton: View {
    @Binding var isHalfSheet: Bool
    let smallHeight: Double = 50
    let smallWidth: Double = 150

    var bigHeight: Double {
        UIScreen.main.bounds.height / 2.0
    }
    var yPosition: Double {
        isHalfSheet ? (UIScreen.main.bounds.height - UIScreen.main.bounds.height / 4) : 40.0
    }
    var xPosition: Double {
        //position can be random
        isHalfSheet ? (UIScreen.main.bounds.width / 2.0) : (UIScreen.main.bounds.width / 2.0)
    }

    var body: some View {
        fakeButton
            .onTapGesture {
                withAnimation {
                    isHalfSheet.toggle()
                }
            }
    }

    var fakeButton: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            Text(isHalfSheet ? "Wrap" : "Unwrap")
                .foregroundColor(.white)
                .scaleEffect(isHalfSheet ? 2 : 1)
                .offset(y: isHalfSheet ? (-bigHeight + smallHeight) / 2 : 0)
        }
        .frame(width: isHalfSheet ? UIScreen.main.bounds.width : smallWidth,
               height: isHalfSheet ? bigHeight : smallHeight)
        .clipShape(RoundedRectangle(cornerRadius: 45, style: .continuous))
        .position(x: xPosition,
                  y: yPosition)
    }
}
