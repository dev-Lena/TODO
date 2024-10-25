
import SwiftUICore
import Combine

class GridTabViewModel: ObservableObject {
    private let todoService: TodoService
    private var cancellables = Set<AnyCancellable>()
    @Published var todos: [Todo] = []
    
    init(_ todoService: TodoService) {
        self.todoService = todoService
        todoService.todosPublisher
            .sink { [weak self] todos in
                self?.todos = todos
            }
            .store(in: &cancellables)
    }
    
    func deleteLastTodo() async {
        await todoService.deleteLastTodo()
    }
}
