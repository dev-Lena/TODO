
import SwiftUICore

class GridTabViewModel: ObservableObject {
    private let todoService: TodoService
    @Published var todos: [Todo] = []
    
    init(_ todoService: TodoService) {
        self.todoService = todoService
        Task {
            self.todos = await todoService.getAllTodos()
        }
    }
    
    func deleteLastTodo() async {
        await todoService.deleteLastTodo()
    }
    
    func deleteLastTodoAsync() {
        Task {
            let result = await todoService.deleteLastTodoAsync()
            switch result {
            case .success:
                await refreshTodos()
            case .failure(let error):
                print("할 일 삭제 에러: \(error)")
            }
        }
    }
    
    func refreshTodos() async {
        self.todos = await todoService.getAllTodos()
    }
}
