//
//  ContentView.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 13.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    XMarkIconButton()
                    XMarkIconHapticButton()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
