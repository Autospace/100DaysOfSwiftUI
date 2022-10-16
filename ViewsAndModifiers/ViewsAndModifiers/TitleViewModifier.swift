//
//  TitleViewModifier.swift
//  ViewsAndModifiers
//
//  Created by Alex Mostovnikov on 16/10/22.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.yellow)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleModifier())
    }
}
