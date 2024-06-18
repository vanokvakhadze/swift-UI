//
//  Coordinator.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import Foundation
import UIKit
import SwiftUI

class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
   
   @ObservedObject var viewModel: ViewModel
   
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let value = $viewModel.newsArray[indexPath.row]
        cell.updateCells(image: value.wrappedValue.photoUrl)
        cell.configure(with: value)
        
       
     
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             let news = viewModel.newsArray[indexPath.row]
             showDetails(for: news)
         }
     
     
    func showDetails(for news: Panicks) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }),
              let topController = keyWindow.rootViewController else {
            return
        }
        
        let detailVC = DetailsPageVC(news: news)
        topController.present(detailVC, animated: true, completion: nil)
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    
}
