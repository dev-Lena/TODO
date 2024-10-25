
import SwiftUI

struct ContentView: View {
    @StateObject private var todoService = TodoService()
    
    var body: some View {
        TabView {
            ListTabView(viewModel: ListTabViewModel(todoService))
                .tabItem { Label("List", systemImage: "list.bullet") }
            
            GridTabView(viewModel: GridTabViewModel(todoService))
                .tabItem { Label("Grid", systemImage: "square.grid.2x2") }
        }
        .environmentObject(todoService)
    }
}
