//
//  ContentView.swift
//  HabitZen
//
//  Created by William on 5/10/23.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
    @State private var showingHabits = false
    
    func removeItems(at offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(habits.items, id: \.id){habit in
                    HStack{
                        Text(habit.habitName)
                            .font(.headline)
                        Spacer()
                        
                        Button{
                            /**
                             habits.items.firstIndex(where:): This method searches the habits.items array for the first element that matches the provided condition. In this case, the condition is { $0.id == habit.id }, which checks if the current element's id matches the id of the habit being displayed in the list. If a matching habit is found, the method returns its index in the array; otherwise, it returns nil.
                             firstIndex(where:) method returned a valid index. If a valid index is found, the following code block will execute:
                             habits.items[index].habitComplete = true
                             */
                            withAnimation {
                                if let index = habits.items.firstIndex(where: { $0.id == habit.id }) {
                                    habits.items[index].habitComplete = true
                                }
                            }
                        } label: {
                            if habit.habitComplete {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 18))
                                    .foregroundColor(.green)
                            }else{
                                Image(systemName: "circle")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("HabitZen")
            .toolbar{
                Button{
                    showingHabits = true
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 28))
                        .foregroundColor(.green)
                }
            }
            .sheet(isPresented: $showingHabits){
                AddView(habits: habits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
