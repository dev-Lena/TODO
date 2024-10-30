
import Combine
import Foundation

actor TodoService: ObservableObject {
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
    
    func addTodo(_ title: String) {
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
    
    func deleteLastTodoAsync() async -> Result<Bool, Error> {
            guard !todos.isEmpty else { return .failure(NSError(domain: "삭제할 할 일이 없습니다", code: 0, userInfo: nil)) }
            todos.removeLast()
            return .success(true)
        }
    
    func getAllTodos() -> [Todo] {
        return todos
    }
}
