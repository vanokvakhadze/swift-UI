//
//  TableViewCell.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import UIKit
import SwiftUI

class TableViewCell: UITableViewCell {
    
    let newsImage = UIImageView()
    
    let insideView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    var date: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    var hostingController: UIHostingController<SwiftChangeText>?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuration()
        //configureAccessibility()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration() {
        contentView.addSubview(newsImage)
        newsImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        newsImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        newsImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        newsImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        newsImage.clipsToBounds = true
        newsImage.layer.cornerRadius = 10
        newsImage.contentMode = .scaleToFill
        
        
    
        
        contentView.addSubview(title)
        title.leadingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
      
                
        contentView.addSubview(date)
        date.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        date.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
       
       
    }
    
    
  
    
    func updateCells(image: String){
        if let imgURL = URL(string: image){
           newsImage.loadImage(from: imgURL)
        }
    }
    
    func configure(with news: Binding<Panicks>) {
        if let imgURL = URL(string: news.wrappedValue.photoUrl) {
               newsImage.loadImage(from: imgURL)
           }
           
           if hostingController == nil {
               let swiftUIView = SwiftChangeText(news: news)
               hostingController = UIHostingController(rootView: swiftUIView)
               if let hostingView = hostingController?.view {
                   hostingView.translatesAutoresizingMaskIntoConstraints = false
                   contentView.addSubview(hostingView)
                   NSLayoutConstraint.activate([
                       hostingView.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 10),
                       hostingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                       hostingView.topAnchor.constraint(equalTo: contentView.topAnchor),
                       hostingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
                   ])
               }
           } else {
               hostingController?.rootView = SwiftChangeText(news: news)
           }
       }
    

}
