//
//  StateAndBindingView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

struct StateAndBindingView: View {
    
    // creating and instance using state property and store a value of '0' initially
    @State private var count = 0
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Counter")
                    .font(.title)
                    .fontWeight(.bold)
                //This displays the value of the state property 'count' in this view based on button action in other view
                Text("Count = \(count)")
            }
            
            // created a seperate view where action performed to changes this view state propertry 'count'
            // Here the state property 'count' is passing and prefixed with '$' as this counter is a Binding property of same reference type
            ButtonView(counter: $count)
            
        }
        .navigationTitle("StateAndBindingView")
        .navigationBarTitleDisplayMode(.inline)

        
    }
}


// Creating this "ButtonView" in same file for easy reference
struct ButtonView: View {
    
    // created a Binding property 'counter'and gave same reference type as of state property 'count' in parentView
    @Binding var counter: Int
    var body: some View {
        VStack {
            Button {
                // On button action, incrementing the counter value and as this is binding proerty, along updating the counter value, it will also update the value of  its state property 'count' in parentView as it is passed as parameter to binding property of this view
                counter += 1
            } label: {
                    Text("Increase the count value to \(counter + 1)")
            }
            
            //Here the counter value increase based on button action
            Text("ButtonView Count = \(counter)")
        }
    }
}

#Preview {
    StateAndBindingView()
}
