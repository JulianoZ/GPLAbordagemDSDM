
class GPSPosition {

 private var dataRealLocationList = [String]()


	
    let locationManager = CLLocationManager()
    var dataRealLocationList = [String]()
    dataRealLocationList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        useData()
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        var dataLocation = [String]()
          dataLocation.append("latitude")
          dataLocation.append("longitude")
        
       dataRealLocationList = getLocation(locValue: locValue, data: dataLocation)      
    
    }
	

func getLocation(locValue: CLLocationCoordinate2D, data: [String])  -> [String]{

        var dataGPS = [String]()
        for dataLocation in data {
            if (dataLocation == "latitude") {
                dataGPS.append("Longitude: " + String(locValue.latitude))                
            }
            if (dataLocation == "longitude") {
                dataGPS.append("Longitude: " + String(locValue.longitude))                
            }
        }        
        return dataGPS	
}

func  useData()  -> Void {
   var x: Int	     
   var data: String	     
   x=0
   while x<dataRealLocationList.size {
      data = dataRealLocationList.get(x)
   x+=1
   }

}

}
