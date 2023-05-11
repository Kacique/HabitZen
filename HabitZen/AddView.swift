//
//  AddView.swift
//  HabitZen
//
//  Created by William on 5/10/23.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    //Form input states
    @State private var habitName = ""
    @State private var habitComplete = false
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name Habit", text: $habitName)
            }
            .navigationTitle("Add new habit")
            .toolbar{
                Button("Save"){
                    let item = HabitItem(habitName: habitName, habitComplete: habitComplete)
                    
                    habits.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
