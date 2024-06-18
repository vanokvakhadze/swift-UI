//
//  ViewModel.swift
//  homework.38
//
//  Created by vano Kvakhadze on 16.06.24.
//

import Foundation
import NetworkPackage

class ViewModel: ObservableObject {
    @Published  var newsArray: [Panicks] = []
 
    
   private let apiKey = "27b91e4b6779486780e044de24d8563a"
   private let apiToken = "yJcTXerji1u9foBGLUoXNVFmHVrJ66XpwdZWdypk"
 

    func fetchData() {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        
        NetworkService().requestData(urlString: urlString) { [weak self] (result: News?, error) in
            if let result = result {
                DispatchQueue.main.async {
                    self?.newsArray = result.list
                }
            }
        }
    }

    
    
}
