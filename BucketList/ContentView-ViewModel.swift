//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Derya Antonelli on 15/12/2022.
//

import Foundation
import MapKit

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var locations = [Location]()
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        
        @Published var selectedPlace: Location?
    }
}
