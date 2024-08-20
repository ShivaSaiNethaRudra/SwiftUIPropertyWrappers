//
//  UserDefaultsView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

struct UserDefaultsView: View {
    // Here AppStorage property wrapper watch Userdefaults.standard on any key value is changed and update the instance created view and updated where is been used automatically
    @AppStorage("counterValue") var counter = 0
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                
                // Here I am using this AppStorage variable 'counter' which store the UserDefault value for key 'counterValue' and it changes it UserDefaultvalue changes anywhere in app automatically instead of specifically calling again
                Text("CounterValue via AppStorage is \(counter)")
                    .font(.title2)
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
                    // Here on Clicking this button, I am removing "counterValue" from UserDefaults and it will update the view where it is been used.
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
