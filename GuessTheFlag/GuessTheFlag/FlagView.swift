//
//  FlagView.swift
//  GuessTheFlag
//
//  Created by Alex Mostovnikov on 16/10/22.
//

import SwiftUI

struct FlagView: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}
