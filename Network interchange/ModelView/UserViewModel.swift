//
//  UserViewModel.swift
//  Network interchange
//
//  Created by abdullah's Ventura on 13.06.2023.
//

import Foundation


class UserListViewModel : ObservableObject {
    @Published var userList = [UserViewModel]()
    
    private var service: NetworkManager
    init(service: NetworkManager){
        self.service = service
    }
    
    
    func downloadUser() async{
        var resource = ""
        if service.type == "Service" {
            resource = Constants.Url.userExtension
        }else{
            resource = Constants.Paths.baseUrl
        }
        
        
        do{
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch{
            print(error)
        }
       
    }
}


struct UserViewModel{
    let user : User
    
    var id : Int{
        user.id
    }
    var name : String{
        user.name
    }
    var username: String{
        user.username
    }
    var email : String{
        user.email
    }
    
}
