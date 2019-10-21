//
//  ViewController.swift
//  parseJSONAlamoESwifty
//
//  Created by Gabriella Messias Aleo on 16/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController:  UITableViewController, UISearchBarDelegate {
    
    var filmes = [Movie]()
    var key = "532e4717"
    var searching = false

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return filmes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuse = "cellReuse"
    
        let cell=tableView.dequeueReusableCell(withIdentifier: cellReuse, for: indexPath) as! cellCustom
        self.tableView?.rowHeight = 110.0
        let filme  = filmes[indexPath.row]
        
        
        cell.titleMovies.text = filme.Title
        cell.yearMovies.text = filme.Year
     
        return cell
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailsMovie"){
            
            if let indice = tableView.indexPathForSelectedRow{
                let movieSelected = self.filmes[indice.row]
                let viewControllerDestino = segue.destination as! DetailsViewController
                viewControllerDestino.filme = movieSelected
            }
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            let search = searchText.replacingOccurrences(of: " ", with: "+")
            let urlDataComplete = "http://www.omdbapi.com/?apikey=\(key)&s=\(search)"
            searching = true
           if search != ""{
               filmes = filmes.filter {filme in
                return  filme.Title.lowercased().contains(search)
            }
           }else{
            self.tableView.reloadData()
        }
            getMovies(url: urlDataComplete)
        }
        func getMovies(url : String){
            Alamofire.request(url, method: .get).responseData { (response) in
                    guard let dados = response.data else { return }
                    do{
                    let decoder = JSONDecoder()
                    let procurar = try decoder.decode(Movies.self, from: dados)
                        self.filmes = procurar.Search
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }catch let error{
                        print(error)
                    }
        }
}
}

