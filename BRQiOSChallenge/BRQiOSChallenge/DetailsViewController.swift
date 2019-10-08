//
//  DetailsViewController.swift
//  BRQiOSChallenge
//
//  Created by Gabriella Messias Aleo on 08/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
import UIKit
class DetailsViewController : UIViewController {
    
    @IBOutlet var imageFilm: UIImageView!
    @IBOutlet weak var titleFilm: UILabel!
    @IBOutlet weak var descriptionFilm: UILabel!
    
    var filme : Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageFilm.image = filme?.imagem
        titleFilm.text = filme?.titulo
        descriptionFilm.text = filme?.descricao
    }
}
