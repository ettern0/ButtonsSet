//
//  MenuButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI

class MenuButton {
    let label: Image
    let action: () -> Void

    init(label: Image, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }
}
