
import Combine
import Foundation

class TodoService: ObservableObject {
    private let repository = TodoRepository()
    private var todos: [Todo] = []
    private let todosSubject = CurrentValueSubject<[Todo], Never>([])
    var todosPublisher: AnyPublisher<[Todo], Never> {
        todosSubject
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    init() {
        todos = repository.fetchTodos()
        todosSubject.send(todos)
    }
    
    func addTodo(_ title: String) async {
        let newTodo = Todo(id: UUID(), title: title)
        todos.append(newTodo)
        repository.saveTodos(todos)
        todosSubject.send(todos)
    }
    
    func deleteLastTodo() async {
        guard !todos.isEmpty else { return }
        todos.removeLast()
        repository.saveTodos(todos)
        todosSubject.send(todos)
    }
}
