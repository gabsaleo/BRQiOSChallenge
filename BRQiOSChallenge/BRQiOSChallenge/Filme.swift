//
//  Filme.swift
//  BRQiOSChallenge
//
//  Created by Gabriella Messias Aleo on 07/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit
struct Filme : Codable{
    var title:String
}
struct Filmes : Codable {
    var results : [Filme]
}
