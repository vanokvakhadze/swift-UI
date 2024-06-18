//
//  SmallImage.swift
//  MovieApp.1
//
//  Created by vano Kvakhadze on 08.06.24.
//

import SwiftUI

struct SmallImages: View {
    var imageOf: UIImage
    var body: some View {
        
        Image(uiImage: imageOf)
            .resizable()
            .frame(width: 16, height: 16)
            .scaledToFill()
    }
}



