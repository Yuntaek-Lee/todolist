//
//  ContentView.swift
//  task management
//
//  Created by snlcom on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FirstView()
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
            .background(.BG)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
