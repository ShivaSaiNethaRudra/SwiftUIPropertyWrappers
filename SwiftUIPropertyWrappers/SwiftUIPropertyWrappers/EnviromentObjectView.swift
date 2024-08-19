//
//  EnviromentObjectView.swift
//  SwiftUIPropertyWrappers
//
//  Created by Shiva Sai Netha Rudra on 8/18/24.
//

import SwiftUI

class MyCustomViewData: ObservableObject {
    @Published var count = 0
}

struct EnviromentObjectView: View {
    @StateObject private var viewData = MyCustomViewData()
    var body: some View {
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
            Subview1().environmentObject(viewData)
        }
        .navigationTitle("EnviromentObjectView")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Subview1:View {
    @State var subview1InternalCount = 0
    var body: some View {
        ZStack {
            VStack {
                Text("Subview1")
                    .font(.title)
                Text("subview1InternalCount is \(subview1InternalCount) ")
                    .font(.title2)
            }
        }
        .background(Color(.yellow)).ignoresSafeArea()
        Subview2(subview2InternalCount: $subview1InternalCount)
    }
}

struct Subview2:View {
    @Binding var subview2InternalCount: Int
    var body: some View {
        ZStack {
            VStack {
                Text("Subview2")
                    .font(.title)
                Text("subview2InternalCount = \(subview2InternalCount)")
                    .font(.title2)
            }
        }
        .background(Color(.yellow)).ignoresSafeArea()
        Subview3(subview3InternalCount: $subview2InternalCount)
    }
}

struct Subview3:View {
    @Binding var subview3InternalCount: Int
    var body: some View {
        ZStack {
            VStack {
                Text("Subview3")
                    .font(.title)
                Text("subview3InternalCount is \(subview3InternalCount)")
                    .font(.title2)
                
            }
        }
        .background(Color(.yellow)).ignoresSafeArea()
        .padding()
        Subview4(subview4InternalCount: $subview3InternalCount)
        
    }
}

struct Subview4:View {
    @EnvironmentObject var viewData: MyCustomViewData
    @Binding var subview4InternalCount: Int
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
            subview4InternalCount = viewData.count
        } label: {
            Text("Incease the count to \(viewData.count + 1)")
                .font(.title2)
        }
    }
}




#Preview {
    EnviromentObjectView()
}
