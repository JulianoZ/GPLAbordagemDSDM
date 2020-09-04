
class Connection {

 
    static func openConnection() -> OpaquePointer?{
        var db: OpaquePointer?
        
        //creating the database        
          let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("ecommerce.sqlite")
        
        
        //Open connection
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        return db
    }


}
