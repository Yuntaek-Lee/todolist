//
//  task_managementApp.swift
//  task management
//
//  Created by snlcom on 6/6/24.
//

import SwiftUI

@main
struct task_managementApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
