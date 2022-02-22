import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Animals.entity(), sortDescriptors: []) var animals: FetchedResults<Animals>
    @State private var newAnimalName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Add New", text: self.$newAnimalName)
                    Button("Save") {self.contentSave()}
                }
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                
                
                List {
                    ForEach(animals, id: \.self) { animal in
                        Text("동물 이름은 \(animal.name!)")
                            .onTapGesture {
                                self.newAnimalName = animal.name!
                            }
                    }
                    .onDelete { IndexSet in
                        for index in IndexSet {
                            self.viewContext.delete(self.animals[index])
                            try? self.viewContext.save()
                        }
                    }
                }
            }
            .navigationTitle("Inbox")
        }
    }
        
        
    func contentSave() {
        let newAnimal = Animals(context: viewContext)
        newAnimal.name = newAnimalName
        try? self.viewContext.save()
    }
}
 

