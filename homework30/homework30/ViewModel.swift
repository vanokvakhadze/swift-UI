//
//  ViewModel.swift
//  homework30
//
//  Created by vano Kvakhadze on 27.05.24.
//

import Foundation
final class ViewModel: ObservableObject {
    @Published var fruits: [Market] =  [
        Market(name: "ბანანი", price: 4.52, amount: 0, supply: 10, image: "banana"),
        Market(name: "მსხალი", price: 3.50, amount: 0, supply: 10, image: "pear"),
        Market(name: "ვაშლი", price: 1.30, amount: 0, supply: 10, image: "apple"),
        Market(name: "ატამი", price: 2.40, amount: 0, supply: 10, image: "peach"),
        Market(name: "ფორთოხალი", price: 5.10, amount: 0, supply: 10, image: "orange"),
        Market(name: "ბალი", price: 3, amount: 0, supply: 10, image: "cherry"),
        Market(name: "ქლიავი", price: 1.50, amount: 0, supply: 10, image: "plum")
    ]
    
    @Published var sale: Bool = false
    
    
    
     var totalAmount: Int {
            return fruits.reduce(0) { $0 + $1.amount }

        }

    
    var totalPrice: Double {
            return fruits.reduce(0.0) { $0 + ($1.price * Double($1.amount)) }
        
        }
  
    
    func addItem(of fruit: Market){
        guard let index = fruits.firstIndex(where: { $0.id == fruit.id }) else {return}
        if fruits[index].supply > 0 {
            fruits[index].amount += 1
            fruits[index].supply -= 1
         }
    }
    
    func removeItem(of fruit: Market){
        guard let index = fruits.firstIndex(where: { $0.id == fruit.id}) else {return}
            if fruits[index].amount > 0{
            fruits[index].amount = max(0, fruits[index].amount - 1)
            fruits[index].supply += 1
            
        }
            
    }
    
    func deleteAmount(of fruit: Market) {
        if let index = fruits.firstIndex(where: {$0.id == fruit.id}){
            //fruits[index].amount = 0 
            fruits[index].supply += fruits[index].amount
            fruits[index].amount = 0
        }
    }
    
    func discount() {
        for index in fruits.indices {
            fruits[index].price *= 0.80
        }
    }
    
    func deleteFromarray(item: IndexSet){
        fruits.remove(atOffsets: item)
    }
}
