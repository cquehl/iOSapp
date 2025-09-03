import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \DataItem.timestamp, order: .reverse) private var items: [DataItem]

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    Text("Item added at: \(item.timestamp, format: .dateTime)")
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Local Data Store")
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = DataItem(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: DataItem.self, inMemory: true)
}