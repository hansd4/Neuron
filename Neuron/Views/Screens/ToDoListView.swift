//
//  ToDoListItemsView.swift
//  Neuron
//
//  Created by Hans de los Santos on 12/10/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                viewModel.delete(id: item.id)
                            }
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "UCuY4cgl4WcjCCJ6BKYH0oUkwsZ2")
}
