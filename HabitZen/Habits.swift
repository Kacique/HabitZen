//
//  Habits.swift
//  HabitZen
//
//  Created by William on 5/10/23.
//

import Foundation

class Habits: ObservableObject{
    @Published var items = [HabitItem](){
        didSet{
            let encoded = JSONEncoder()
            
            if let encoded = try? encoded.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
