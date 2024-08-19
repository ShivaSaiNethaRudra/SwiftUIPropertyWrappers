//
//  UserDefaultsView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

struct UserDefaultsView: View {
    @AppStorage("counterValue") var counter = 0
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                Text("CounterValue in Mainview is \(counter)")
                    .font(.title)
                Button("Increase Counter") {
                    counter += 1
                }
                .font(.title2)
                .fontWeight(.bold)
            }
            .padding()
        }
        .background(Color(.yellow))
        DisplayView()
    }
}

struct DisplayView:View {
    var body: some View {
        ZStack {
            VStack {
                Button("Reset counter") {
                    UserDefaults.standard.removeObject(forKey: "counterValue")
                }
                .font(.title2)
                .fontWeight(.bold)
            }
            .padding()
        }
        .background(Color(.orange))
    }
}

#Preview {
    UserDefaultsView()
}
