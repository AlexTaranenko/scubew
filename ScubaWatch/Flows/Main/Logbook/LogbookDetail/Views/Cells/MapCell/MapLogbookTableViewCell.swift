//
//  MapLogbookTableViewCell.swift
//  ScubaWatch
//
//  Created by Alex on 11.07.2023.
//

import MapKit
import UIKit

class MapLogbookTableViewCell: UITableViewCell, UIPresentable {

    @IBOutlet weak var mapImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        clearBG()
        
        mapImageView?.cornerRadius = 20
    }
    
    func populateMapLogbookCell(_ lat: Double, _ lon: Double) {
        
        let region = MKCoordinateRegion(center:
                                            CLLocationCoordinate2D(latitude: lat, longitude: lon),
                                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        let mapOptions = MKMapSnapshotter.Options()
        mapOptions.region = region
        mapOptions.mapType = .standard
        mapOptions.size = CGSize(width: UIScreen.main.bounds.width - 32, height: 317)
        mapOptions.showsBuildings = true
        
        let snapshotter = MKMapSnapshotter(options: mapOptions)
        snapshotter.start { snapshot, error in
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.mapImageView?.image = snapshot.image
                }
            }
        }
    }
}
