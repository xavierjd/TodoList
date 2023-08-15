//
//  ListRowView.swift
//  TodoList
//
//  Created by xavier on 12/08/23.
//

import SwiftUI

struct ListRowView: View {

    let entity: ItemEntity

    var body: some View {
        HStack {
            Image(systemName: entity.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(entity.isCompleted ? .green : .red)
            Text(entity.title ?? "" )
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

//struct ListRowView_Previews: PreviewProvider {
//
//    static var item1 = ItemModel(title: "First item", isCompleted: false)
//    static var item2 = ItemModel(title: "Second item", isCompleted: true)
//
//    static var previews: some View {
//        Group {
//            ListRowView(item: item1)
//            ListRowView(item: item2)
//        }
//        .previewLayout(.sizeThatFits)
//    }
//}
