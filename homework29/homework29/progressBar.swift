//
//  progressBar.swift
//  homework29
//
//  Created by vano Kvakhadze on 25.05.24.
//

import SwiftUI

struct progressBar: View {
    var width: CGFloat = 300
    var height: CGFloat = 20
    var totalPercent: CGFloat = 100
    var completedPercent: CGFloat = 5
    
    var body: some View {
        let multiplayer = width / 100
        ZStack (alignment: .leading){
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(.progressBar)
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: completedPercent * multiplayer , height: height)
                .foregroundColor(Color(hex: 0x73ABFF))
                .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous))
        }
        .foregroundColor(.clear)
    }
}

#Preview {
    progressBar()
}
