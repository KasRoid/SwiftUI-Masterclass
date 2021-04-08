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
                //                MapAnnotation(coordinate: item.location, content: {
                //                    Image("logo")
                //                        .resizable()
                //                        .scaledToFit()
                //                        .frame(width: 32, height: 32, alignment: .center)
                //                })
                // Custom Advanced Annotation (Interactive)
                MapAnnotation(coordinate: item.location, content: {
                    MapAnnotationView(location: item)
                })
            })
            .overlay(
                HStack(alignment: .center, spacing: 12, content: {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        Divider()
                        HStack {
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                    }
                })
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black
                                .cornerRadius(8)
                                .opacity(0.6)
                )
                .padding(),
                alignment: .top
            )
    }
}

// MARK: - PreviewProvider
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
