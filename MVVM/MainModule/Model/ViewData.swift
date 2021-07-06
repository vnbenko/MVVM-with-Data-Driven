//
//  ViewData.swift
//  MVVM
//
//  Created by Meraki on 06.07.2021.
//

import Foundation

enum ViewData {
    case initial
    case loading(Data)
    case success(Data)
    case failure(Data)
    
    struct Data {
        var icon: String?
        var title: String?
        var description: String?
    }
}
