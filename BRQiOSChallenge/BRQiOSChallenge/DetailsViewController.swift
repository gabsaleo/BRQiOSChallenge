//
//  DetailsViewController.swift
//  BRQiOSChallenge
//
//  Created by Gabriella Messias Aleo on 08/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class DetailsViewController : UIViewController {
    
    @IBOutlet var imageFilm: UIImageView!
   
    @IBOutlet weak var titleMoviesDetails: UILabel!
    
    @IBOutlet weak var yearMoviesDetails: UILabel!
    
    @IBOutlet weak var typeMoviesDetails: UILabel!
    var filme : Movie?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            loadAttibutes()
            loadImages()
        }
        func loadImages(){
            
            imageFilm.sd_imageIndicator = SDWebImageActivityIndicator.gray
    //        imageView2.sd_imageIndicator = SDWebImageProgressIndicator.`default`
            imageFilm.sd_setImage(with: URL(string:filme!.Poster))
        }
        func loadAttibutes(){
            titleMoviesDetails.text = filme?.Title
            yearMoviesDetails.text = filme?.Year
            typeMoviesDetails.text = filme?.Type
        }
}
