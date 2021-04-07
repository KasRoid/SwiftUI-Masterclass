//
//  MapView.swift
//  Africa
//
//  Created by Kas Song on 2021/04/01.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    // MARK: - Body
    var body: some View {
        // Basic Map
//        Map(coordinateRegion: $region)
        // Advanced Map
        Map(coordinateRegion: $region,
            annotationItems: locations,
            annotationContent: { item in
                // Pin: Old Style (always static)
//                MapPin(coordinate: item.location, tint: .accentColor)
                // Marker: New Style (always static)
//                MapMarker(coordinate: item.location, tint: .accentColor)
                // Custom Basic Annotation (interactive)
                MapAnnotation(coordinate: item.location, content: {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                })
        })
    }
}

// MARK: - PreviewProvider
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
