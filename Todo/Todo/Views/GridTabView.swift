
import SwiftUI

struct GridTabView: View {
    @StateObject var viewModel: GridTabViewModel
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.todos) { todo in
                        Text(todo.title)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Todo Grid")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("마지막 할 일 삭제") {
                        viewModel.deleteLastTodoCombine()
                    }
                }
            }
        }
    }
}
