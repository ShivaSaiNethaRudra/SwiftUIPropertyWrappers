//
//  StateObjectAndObservableObjectView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

//To Establish the connection between StateObject and observedObject, we must declare the custom object as Observable object, so that its custom properties can be accessable for read and write from both view where this object instance is created via stateObject and declared via ObservedObject or EnvironmentObject
class MyCounterViewModel: ObservableObject {
    @Published var count = 0
}


struct StateObjectAndObservableObjectView: View {
    
    // created StateOject property wrapper 'counterModel' instance of a customer class 'MyCounterViewModel' ObservableObject
    // Every StateObject can have ObservedObject and then StateObject must confirm to ObservableObject protocol with Published property wrapper if the other views have impact by this value inside this custom class
    @StateObject private var counterModel = MyCounterViewModel()
    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("Counter")
                    .font(.title)
                    .fontWeight(.bold)
                //This displays the value of the @published property 'count' in custom class 'MyCounterViewModel' with ObservableOject protocol as  stateObject property 'counterModel' in this View refered to custom class 'MyCounterViewModel' and this value keeps updated based on bitton action in other view 'MyCounterView' where they are increasing the 'count' published property value of the 'MyCounterViewModel' as 'MyCounterView' as 'textModel' ObservedObject property reference to 'MyCounterViewModel'
                Text("Count = \(counterModel.count)")
            }
            
            // created a seperate view where action performed to changes this view StateObject propertry 'counterModel'
            // Here the StateObject property 'counterModel' is passing for counterModel key as this 'counterModel' is a ObservedObject of same type
            MyCounterView(counterModel: counterModel)
        }
        .navigationTitle("StateObjectAndObservableObjectView")
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct MyCounterView:View {
    @ObservedObject var counterModel: MyCounterViewModel
    var body: some View {
        VStack {
            Button {
                // On button action, incrementing the count value, it will also update the value of  its stateObject property in 'StateObjectAndObservableObjectView'
                counterModel.count += 1
            } label: {
                    Text("Increase the count value to \(counterModel.count + 1)")
            }
            
            //Here the count value increase based on button action
            Text("ButtonView Count = \(counterModel.count)")
        }
    }
}

#Preview {
    StateObjectAndObservableObjectView()
}
