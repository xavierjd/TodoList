//
//  TodoListApp.swift
//  TodoList
//
//  Created by xavier on 12/08/23.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var viewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(viewModel)            
        }
    }
}
