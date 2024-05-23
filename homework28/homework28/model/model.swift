//
//  model.swift
//  homework28
//
//  Created by vano Kvakhadze on 23.05.24.
//

import Foundation

class ClassWork: Identifiable, Hashable {
  
    
    var title: String
    var text: String
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    static func == (lhs: ClassWork, rhs: ClassWork) -> Bool {
            return lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
}

var classWork = [ClassWork(title: "რა დაუწუნა ბარბარემ ნიკის?", text: "ნიკის ამაზე ჯერ განცხადება არ გაუკეთებია, ფანები ელოდებიან რომ რომელიმე მალე სიჩუმეს გაფანტავს"), ClassWork( title: "რა ზომის ფეხი აქვს ვასოს?", text: "დეველოპერებმა განაცხადეს რომ თუ მას 42 და მეტი ზომა ფეხი აქვს მის მოსმენას აზრი არ აქვს და კომენტარის გარეშე დატოვებენ ლექციას"), ClassWork(title: "რა სიმაღლისაა ანჟელა ew?", text: "ანჟელა ew არის მეტრაოთხმოცი, რაც ნიშნავს რომ ის დაახლოებით ტეილორ Swift-ის სიმაღლისაა და დიდი ფეხი აქვს"), ClassWork(title: "რატომ გაებუტა ბარბარეს ჭეპეტე?", text: "ამჟამინდელი მონაცემებით ისინი 2 დღე არ ესაუბრებოდნენ ერთმანეთს და როგორც გაირკვა ანიგნორებს აიგნორებდნენ რაღაც იგნორში."),  ClassWork(title: "MVC vs MVVM", text: "აი ეს MVC გასაგებია, მაგრამ MVVM ჩემამდე არ დადის რა, ამ სვიბთ იუაიში სად ვიყენებთ მაგას?"),  ClassWork(title: "ნეტავ რამდენი ხანი გაგრძელდება ეს?", text: "აღმოჩნდა რომ დეველოპერები ძალიან გახარებულები არიან SwiftUI-ით. ნეტავ რამდენი ხანი გაგრძელდება Honeymoon phase?"),  ClassWork( title: "რას ფიქრობთ სვიფთზე?", text: "ლექციაზე უფრო მარტივი ჩანდა"),  ClassWork(title: "რა დროს უთმობენ დეველოპერები კოდირებას?", text: "8-10 სააათი "),  ClassWork(title: "რატომ აიღეს სტალინის ძეგლი?", text: "დიდი ალბათობით მოიპარეს"), ClassWork(title: "მეტი რატო არ წერია?", text: "ვეღარ ვფიქრობ :დ") ]
