
import SwiftUI

struct ListTabView: View {
    @StateObject var viewModel: ListTabViewModel
    @State private var newTodoTitle = ""
    
    var body: some View {
        NavigationView {
            List(viewModel.todos) { todo in
                Text(todo.title) // 할 일 제목 표시
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        Task {
                            await viewModel.addTodoAsync("New Todo") // 새 할 일 추가
                        }
                    }
                }
            }
        }
    }
}

