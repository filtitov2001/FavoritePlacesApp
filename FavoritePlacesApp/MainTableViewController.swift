//
//  MainTableViewController.swift
//  FavoritePlacesApp
//
//  Created by Felix Titov on 6/3/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import UIKit

class MainTableViewController: UITableViewController {
    
    
    var places = Place.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]
        
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil {
            cell.placeImageView.image = UIImage(named: place.restaurantImage ?? "")
        } else {
            cell.placeImageView.image = place.image
        }
        
        
        cell.placeImageView.layer.cornerRadius = cell.placeImageView.frame.size.height / 2
        cell.placeImageView.clipsToBounds = true
        
        return cell
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceTableViewController else { return }
        
        newPlaceVC.saveNewPlace()
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
