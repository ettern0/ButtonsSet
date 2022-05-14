//
//  ContentView.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isActiveHalfSheet = false
    @State var isActiveCircleButton = false
    @State var isActiveSemiCircleButton = false
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 10) {
                    CircleMenuButton(isActive: $isActiveCircleButton)
                    SemiCircleMenuButton(isActive: $isActiveSemiCircleButton)
                    if !isActiveCircleButton, !isActiveSemiCircleButton {
                        HalfScreenInfoButton(isHalfSheet: $isActiveHalfSheet)
                    }
                    Spacer(minLength: 10)
                    if !isActiveHalfSheet, !isActiveCircleButton, !isActiveSemiCircleButton {
                        Group {
                            InfinityWidthButton()
                            InfinityWidthHapticButton()
                            XMarkIconButton()
                            XMarkIconHapticButton()
                            HexagonButton()
                            PentagonButton()
                            MorfPolygonButton()
                            ParallaxMultiHexagotButton()
                            Parallax3DMultiHexagotButton()
                        }.padding(.horizontal)
                    }
                   // Spacer()
                }
            }
        }.preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
