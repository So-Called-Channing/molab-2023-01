//
//  ContentView.swift
//  FinalProject
//
//  Created by Channing Yang on 2/29/24.
//

import SwiftUI
import SwiftData
import MapKit
import CoreLocation


struct MapView: UIViewRepresentable {
    @ObservedObject var locationManager = LocationManager()

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if let userLocation = locationManager.location {
            let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            view.setRegion(region, animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(locationManager: locationManager)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var locationManager: LocationManager

        init(locationManager: LocationManager) {
            self.locationManager = locationManager
        }

        func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
            if mode == .followWithHeading {
                mapView.setUserTrackingMode(.follow, animated: true)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.all)
                .frame(height: 300)
//            ContentView()
            
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}

/*
struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

*/

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}

