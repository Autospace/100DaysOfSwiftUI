//
//  ContentView.swift
//  BetterRest
//
//  Created by Aliaksei Mastounikau on 3.11.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "r.circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.system(size: 40))
            Text("Better Rest")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
