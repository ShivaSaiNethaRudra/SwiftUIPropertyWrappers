//
//  ContentView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
            NavigationStack {
                VStack(spacing: 30) {
                    NavigationLink(destination: StateAndBindingView()) {
                        Text("StateAndBindingView")
                            .font(.title)
                    }
                    NavigationLink(destination: StateObjectAndObservableObjectView()) {
                        Text("StateObjectAndObservableObjectView")
                            .font(.title)
                    }
                    NavigationLink(destination: EnviromentObjectView()) {
                        Text("EnviromentObjectView")
                            .font(.title)
                    }
                }
                .navigationTitle("Property Wrappers")
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            .padding()
    }
}

#Preview {
    ContentView()
}
