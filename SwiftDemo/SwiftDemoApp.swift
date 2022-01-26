//
//  SwiftDemoApp.swift
//  SwiftDemo
//
//  Created by 小山 on 2021/12/17.
//

import SwiftUI

@main
struct SwiftDemoApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationTitle("小山与Bug")
            }
            .navigationViewStyle(.stack)
        }
    }
}
