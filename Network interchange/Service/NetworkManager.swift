//
//  NetworkManager.swift
//  Network interchange
//
//  Created by abdullah's Ventura on 13.06.2023.
//

import Foundation

protocol NetworkManager{
    func download(_ resource: String) async throws -> [User]
    //local ile internetteki json dosyasini ayirmak icin degisken olusturuyoruz 
    var type : String { get }
}
