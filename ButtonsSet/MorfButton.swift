//
//  MorfButton.swift
//  ButtonsSet
//
//  Created by Evgeny Serdyukov on 14.05.2022.
//

import SwiftUI

struct MorfPolygonButton: View {

    @State var sides: Int = 3

    var body: some View {
        HStack {
            Text("Morf polygon")
                .foregroundColor(.black)
            Spacer()
            Button {
               changePolygon()
            } label: {
                Polygon(sides: sides)
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: 60, height: 60)
            }.buttonStyle(PolygonsHexagonButtonStyle())
        }
    }

    private func changePolygon() {
        sides += 1
        if sides > 8 {
            sides = 3
        }
    }
}
