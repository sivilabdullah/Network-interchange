//
//  ContentView.swift
//  Network interchange
//
//  Created by abdullah's Ventura on 9.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userListViewModel : UserListViewModel
    init(){
        self.userListViewModel = UserListViewModel(service:LocalService())
    }
    var body: some View {
        List(userListViewModel.userList,id: \.id){ user in
            VStack{
                
                    Text(user.name)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title3)
                        .foregroundColor(.gray)
                    Text(user.username)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title3)
                        .foregroundColor(.blue)
                
                Text(user.email)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .font(.title3)
                    .foregroundColor(.yellow)
            }
            
        }.task {
            await userListViewModel.downloadUser()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
