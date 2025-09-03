import SwiftUI

struct ContentView: View {
    @State private var items: [DataItem] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        Text("Item #\(item.id)")
                            .font(.headline)
                        Text("Added at: \(item.timestamp, format: .dateTime)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Hello World")
            .toolbar {
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
        .onAppear {
            loadSampleData()
        }
    }
    
    private func addItem() {
        let newItem = DataItem(timestamp: Date())
        items.append(newItem)
    }
    
    private func deleteItems(offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    private func loadSampleData() {
        if items.isEmpty {
            items.append(DataItem(timestamp: Date()))
        }
    }
}

#Preview {
    ContentView()
}