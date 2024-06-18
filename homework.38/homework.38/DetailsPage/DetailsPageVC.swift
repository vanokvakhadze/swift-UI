//
//  DetailsPage.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import Foundation
import UIKit

class DetailsPageVC: UIViewController {
    var news: Panicks
    
    init(news: Panicks) {
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleOfNews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    var newsImage = UIImageView()
    
    let overView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let time: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addImage()
        addTitle()
        addOverView()
    }
    
    
    func addImage(){
        view.addSubview(newsImage)
        newsImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            newsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newsImage.widthAnchor.constraint(equalToConstant: 200),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        newsImage.clipsToBounds = true
        newsImage.layer.cornerRadius = 10
        if let imgURL = URL(string: news.photoUrl){
           newsImage.loadImage(from: imgURL)
        }
        
        
    }
    
    func addTitle(){
     
        view.addSubview(time)
        time.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 50).isActive = true
        time.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        time.text = news.time
        time.textColor = .darkGray
    }
    
    
    func addOverView() {
        view.addSubview(overView)
        NSLayoutConstraint.activate([
            overView.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 40),
            overView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            overView.heightAnchor.constraint(equalTo: view.heightAnchor),
            overView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20)
            
        ])
        overView.text = news.title
        overView.textColor = .secondaryLabel
            
    }
}
