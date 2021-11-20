//
//  MusicPlayerModel.swift
//  Zenned In
//
//  Created by Logan Thompson on 10/12/21.
//

import Foundation

struct Album : Hashable {
    var id = UUID()
    var name : String
    var image : String
    var songs : [Song]
}

struct Song : Hashable {
    var id = UUID()
    var name : String
    var time : String
    var file : String
}

