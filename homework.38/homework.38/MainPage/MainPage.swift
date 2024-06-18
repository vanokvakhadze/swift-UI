//
//  MainPage.swift
//  homework.38
//
//  Created by vano Kvakhadze on 17.06.24.
//

import SwiftUI

struct MainPage: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            HStack{
                Text("News")
                    .bold()
                
                Spacer()
                    .frame(width: 300)
            }
            
            
            TableViewVC(viewModel: viewModel)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        .onAppear {
            viewModel.fetchData()
        }
        
    }
    
    
}

//MARK: tableview
struct TableViewVC: UIViewRepresentable {
    
    @ObservedObject var viewModel: ViewModel
    
    
    private func createTableView() -> UITableView{
        let table = UITableView()
        table.delegate = makeCoordinator()
        table.dataSource = makeCoordinator()
        table.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        return table
        
        
    }
    func makeUIView(context: Context) -> UITableView {
        createTableView()
    }
    
    
    
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
        uiView.delegate = context.coordinator
        uiView.dataSource = context.coordinator
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(viewModel: viewModel)
    }
}

#Preview {
    MainPage(viewModel: ViewModel())
}
