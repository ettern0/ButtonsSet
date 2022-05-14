//
//  MenuItemView.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI

struct MenuItemView: View {
    let buttonLabel: AnyView
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            buttonLabel
        }
        .frame(width: 40, height: 40)
        .background(Color.random)
        .foregroundColor(.white)
        .clipShape(Circle())
    }
}
