
import SwiftUI

struct ListTabView: View {
    @StateObject var viewModel: ListTabViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.todos) { todo in 
                    Text(todo.title)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        Task {
                            await viewModel.addTodo("New Todo")
                        }
                    }
                }
            }
        }
    }
}
