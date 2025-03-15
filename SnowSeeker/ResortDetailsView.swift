//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by 千々岩真吾 on 2025/03/15.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort

    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        case 3: "Large"
        default: "Unknown"
        }
    }

    var price: String {
        String(repeating: "$", count: resort.price)
    }

    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }

            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
