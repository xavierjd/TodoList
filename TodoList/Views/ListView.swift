//
//  ListView.swift
//  TodoList
//
//  Created by xavier on 12/08/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.savedItems.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.savedItems) { entity in
                        
                        HStack {
                            Image(systemName: entity.isCompleted ? "checkmark.circle" : "circle")
                                .foregroundColor(entity.isCompleted ? .green : .red)
                            Text(entity.title ?? "" )
                            Spacer()
                        }
                        .font(.title2)
                        .padding(.vertical, 8)
                        //ListRowView(entity: entity)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(entity: entity)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    //.onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }

        }

        .navigationTitle("Todo List 📖")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add"){
                    AddView()
                }
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


