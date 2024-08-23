//
//  EnviromentObjectView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI


//To Establish the connection between StateObject and observedObject, we must declare the custom object as Observable object, so that its custom properties can be accessable for read and write from both view where this object instance is created via stateObject and declared via ObservedObject or EnvironmentObject
class MyCustomViewData: ObservableObject {
    @Published var count = 0
}

struct EnviromentObjectView: View {
    @StateObject private var viewData = MyCustomViewData()
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        if colorScheme == .light {
            VStack{
                Text("Counter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                ZStack {
                    VStack {
                        Text("Parentview")
                            .font(.title)
                        Text("Count = \(viewData.count)")
                    }
                    .padding()
                    
                }
                .background(Color(.green)).ignoresSafeArea()
                Subview1(viewData: viewData).environmentObject(viewData)
            }
            .navigationTitle("EnviromentObjectView")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Subview1:View {
    @ObservedObject var viewData: MyCustomViewData
    var body: some View {
        ZStack {
            VStack {
                Text("Subview1")
                    .font(.title)
                Text("subview1InternalCount is \(viewData.count) ")
                    .font(.title2)
            }
        }
        .background(Color(.yellow)).ignoresSafeArea()
        Subview2(viewData: viewData)
    }
}

struct Subview2:View {
    @ObservedObject var viewData: MyCustomViewData
    var body: some View {
        ZStack {
            VStack {
                Text("Subview2")
                    .font(.title)
                Text("subview2InternalCount = \(viewData.count)")
                    .font(.title2)
            }
        }
        .background(Color(.yellow)).ignoresSafeArea()
        Subview3(viewData: viewData)
    }
}

struct Subview3:View {
    @ObservedObject var viewData: MyCustomViewData
    var body: some View {
        ZStack {
            VStack {
                Text("Subview3")
                    .font(.title)
                Text("subview3InternalCount is \(viewData.count)")
                    .font(.title2)
                
            }
        }
        .background(Color(.yellow)).ignoresSafeArea()
        .padding()
        Subview4()
        
    }
}

struct Subview4:View {
    // When a variable declared to a custom obejct as EnvironmentObject, it will update its instance and its properties in the View where it is created and will update the view immediately
    // Here this EnvironmentObject variable instance is created in parent view as @StateObject
    // Here When Loading this view, there is no parameter is passed from its loading parent view.
    @EnvironmentObject var viewData: MyCustomViewData
    var body: some View {
        ZStack {
            VStack {
                Text("Subview4")
                    .font(.title)
                Text("Count = \(viewData.count)")
                    .font(.title2)
            }
        }
        .background(Color(.green)).ignoresSafeArea()
        .padding()
        Button {
            viewData.count += 1
        } label: {
            Text("Incease the count to \(viewData.count + 1)")
                .font(.title2)
        }
        
        Button {
            viewData.count = 0
        } label: {
            Text("Reset counter")
                .font(.title2)
        }
    }
}




#Preview {
    EnviromentObjectView()
}
