//
//  Filme.swift
//  BRQiOSChallenge
//
//  Created by Gabriella Messias Aleo on 07/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit
class Filme{
    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    
    init(titulo:String, descricao:String, image: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = image
    }
}
