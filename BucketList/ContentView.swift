//
//  ContentView.swift
//  BucketList
//
//  Created by Derya Antonelli on 08/12/2022.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let locations = [
        Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]
    
    private var fileName = "example.txt"
    var body: some View {
        NavigationView
        {
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text("\(location.name)")
                    } label: {
                        VStack {
                            Circle()
                                .stroke(.red, lineWidth: 3)
                                .frame(width: 44, height: 44)
                        }
                    }
                    
                }
            }
            .navigationTitle("London explorer")
        }
        //        Text("Tap for file read / write")
        //            .onTapGesture {
        //                let str = "Test message"
        //
        //                FileManager.writeDocument(fileName: fileName, content: str) {
        //                    result in
        //                    if let result = result {
        //                        print(result.localizedDescription)
        //                    }
        //                }
        //
        //                FileManager.readDocument(fileName: fileName) {
        //                    result in
        //                    switch result {
        //                    case .success(let content):
        //                        print(content)
        //                    case .failure(let error):
        //                        print(error)
        //                    }
        //
        //                }
        //
        //            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
