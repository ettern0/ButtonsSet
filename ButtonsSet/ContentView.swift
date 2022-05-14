//
//  ContentView.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isHalfSheet = false
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 10) {
                    HalfScreenInfoButton(isHalfSheet: $isHalfSheet)
                    Spacer(minLength: 10)
                    if !isHalfSheet {
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
                    Spacer()
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
