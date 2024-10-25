
import Combine
import SwiftUICore

class ListTabViewModel: ObservableObject {
    private let todoService: TodoService
    @Published var todos: [Todo] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(_ todoService: TodoService) {
        self.todoService = todoService
        todoService.todosPublisher
            .sink { [weak self] todos in
                self?.todos = todos
            }
            .store(in: &cancellables)
    }
    
    func addTodo(_ title: String) async {
        await todoService.addTodo(title)
    }
}
