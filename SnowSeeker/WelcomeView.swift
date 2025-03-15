//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by 千々岩真吾 on 2025/03/15.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)

            Text(
                "Please select a resort from the left-hand menu; swipe from the left edge to show it."
            )
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
