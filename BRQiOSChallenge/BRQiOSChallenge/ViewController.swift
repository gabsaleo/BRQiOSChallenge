//
//  ViewController.swift
//  BRQiOSChallenge
//
//  Created by Gabriella Messias Aleo on 07/10/19.
//  Copyright © 2019 Gabriella Messias Aleo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var listFilms: [Filme] = []
       var filterList = [Filme]()
       var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listFilms.append(Filme(titulo: "Laranja Mecanica", descricao: "Muita violencia e muito moloko vellocet", image: UIImage(named:"laranjaMecanica")!))
        listFilms.append(Filme(titulo: "Harry Potter", descricao: "Vc é um bruxo harry", image: UIImage(named: "harryPotter")!))
        listFilms.append(Filme(titulo: "Jogos Vorazes", descricao: "jogos vorazs mesmo", image: UIImage(named: "jogosVorazes")!))
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching){
            return filterList.count
        }
        return listFilms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuse = "cellReuse"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuse, for: indexPath) as! cellCustom
        
        cell.imagemFilme.layer.cornerRadius = 40
        cell.imagemFilme.clipsToBounds = true
        self.tableView?.rowHeight = 110.0
        
        if(searching){
            cell.imagemFilme.image = filterList[indexPath.row].imagem
            cell.nomeFilme.text = filterList[indexPath.row].titulo
            cell.subtituloFilme.text = filterList[indexPath.row].descricao
        }else{
            cell.imagemFilme.image = listFilms[indexPath.row].imagem
            cell.nomeFilme.text = listFilms[indexPath.row].titulo
            cell.subtituloFilme.text = listFilms[indexPath.row].descricao
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDetails"){
            if let indexPath = tableView.indexPathForSelectedRow{
                           if(searching){
                               let filmSelected = self.filterList[indexPath.row]
                               let viewControllerDestino = segue.destination as! DetailsViewController
                               viewControllerDestino.filme = filmSelected
                           }else{
                               let filmSelected = self.listFilms[indexPath.row]
                               let viewControllerDestino = segue.destination as! DetailsViewController
                               viewControllerDestino.filme = filmSelected
              }
           }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearchText(searchText: searchText)
        searching = true
        tableView.reloadData()
    }
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        if searchText != "" {
            filterList = listFilms.filter {filme in
                return  filme.titulo.lowercased().contains(searchText.lowercased())

            }
        }else { self.filterList = self.listFilms}
    }


}

