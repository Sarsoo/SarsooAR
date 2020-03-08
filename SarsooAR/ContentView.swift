//
//  ContentView.swift
//  SarsooAR
//
//  Created by Andy Pack on 08/03/2020.
//  Copyright © 2020 Sarsoo. All rights reserved.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    
    @State var showingSession = false
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ARViewContainer().edgesIgnoringSafeArea(.all)) {
                    Text("Launch Session")
                }
                Button(action: { self.showingSession = true }) {
                    Text("Launch Modal Session")
                }.sheet(isPresented: $showingSession) {
                    ARViewContainer().edgesIgnoringSafeArea(.all)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("SarsooAR")
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
