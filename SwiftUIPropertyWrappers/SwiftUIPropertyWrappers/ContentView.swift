//
//  ContentView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        VStack() {
            NavigationStack {
                NavigationLink(destination: StateAndBindingView()) {
                    Text("StateAndBindingView")
                }
                NavigationLink(destination: StateObjectAndObservableObjectView()) {
                    Text("StateObjectAndObservableObjectView")
                }
                NavigationLink(destination: EnviromentObjectView()) {
                    Text("EnviromentObjectView")
                }
            }
            .navigationBarTitle("SwiftUI Property Wrappers")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
