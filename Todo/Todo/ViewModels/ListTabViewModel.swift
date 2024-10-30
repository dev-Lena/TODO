
import Combine
import SwiftUICore

class ListTabViewModel: ObservableObject {
    private let todoService: TodoService
    @Published var todos: [Todo] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(_ todoService: TodoService) {
        self.todoService = todoService
        Task {
            await todoService.todosPublisher
                .receive(on: DispatchQueue.main)
                .sink { [weak self] todos in
                    self?.todos = todos
                }
                .store(in: &cancellables)
                }
    }
    
    func addTodo(_ title: String) {
        Task {
            await todoService.addTodo(title)
        }
    }
}
