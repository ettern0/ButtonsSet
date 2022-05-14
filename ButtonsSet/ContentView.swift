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
                    if !isHalfSheet {
                        Group {
                            XMarkIconButton()
                            XMarkIconHapticButton()
                            HexagonButton()
                            PentagonButton()
                            MorfPolygonButton()
                            InfinityWidthButton()
                            InfinityWidthHapticButton()
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
