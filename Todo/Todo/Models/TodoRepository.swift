
import Foundation

class TodoRepository {
    private let storageKey = "todos"
    
    func fetchTodos() -> [Todo] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let todos = try? JSONDecoder().decode([Todo].self, from: data) else {
            return []
        }
        return todos
    }
    
    func saveTodos(_ todos: [Todo]) {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}
