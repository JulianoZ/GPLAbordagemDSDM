
class OrderFinalizedDAO {

func UpdateObject(e: OrderFinalized)  -> String{
      
	        string result;
	        sharedInstance.database!.open()
	        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE OrderFinalized SET valueTotal = ?  , client_idClients = ?  , dateTime = ?  , zipCodeDelivery_idZipCodeDelivery = ?  , valueChange = ?  , payment_idPayment = ?  , statusOrdered = ?  , statusOrderLocal = ?  , note = ?  , tableNumber = ?  , checkout = ?  , primaryKey = ?  , user = ?  WHERE id = ?", withArgumentsInArray: [e.valueTotal, e.client_idClients, e.dateTime, e.zipCodeDelivery_idZipCodeDelivery, e.valueChange, e.payment_idPayment, e.statusOrdered, e.statusOrderLocal, e.note, e.tableNumber, e.checkout, e.primaryKey, e.user, e.id])
	        sharedInstance.database!.close()
	        if (isUpdated){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

func SelectObject(ord: string)  -> [OrderFinalized]{
     sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , valueTotal , client_idClients , dateTime , zipCodeDelivery_idZipCodeDelivery , valueChange , payment_idPayment , statusOrdered , statusOrderLocal , note , tableNumber , checkout , primaryKey , user from OrderFinalized", withArgumentsInArray: nil)
	        let listOrderFinalized : NSMutableArray = NSMutableArray()
	        if (resultSet != nil) {
	        	while resultSet.next() {
	        		let obj : OrderFinalized = OrderFinalized()
	        		obj.id = resultSet.intForColumn("id")	        		       		  
	        		obj.valueTotal = resultSet.floatForColumn("valueTotal")	        		       		  
	        		obj.client_idClients = resultSet.intForColumn("client_idClients")	        		       		  
	        		obj.dateTime = resultSet.dateTimeForColumn("dateTime")	        		       		  
	        		obj.zipCodeDelivery_idZipCodeDelivery = resultSet.intForColumn("zipCodeDelivery_idZipCodeDelivery")	        		       		  
	        		obj.valueChange = resultSet.floatForColumn("valueChange")	        		       		  
	        		obj.payment_idPayment = resultSet.intForColumn("payment_idPayment")	        		       		  
	        		obj.statusOrdered = resultSet.intForColumn("statusOrdered")	        		       		  
	        		obj.statusOrderLocal = resultSet.intForColumn("statusOrderLocal")	        		       		  
	        		obj.note = resultSet.stringForColumn("note")	        		       		  
	        		obj.tableNumber = resultSet.intForColumn("tableNumber")	        		       		  
	        		obj.checkout = resultSet.boolForColumn("checkout")	        		       		  
	        		obj.primaryKey = resultSet.intForColumn("primaryKey")	        		       		  
	        		obj.user = resultSet.UserForColumn("user")	        		       		  
	        		listOrderFinalized.addObject(obj)
	        	}
	        }
            sharedInstance.database!.close()
            return listOrderFinalized
}

func SelectSpecificIdObject(e: Product, id: int)  -> Product{
    	   
	        sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , name , description , shortDescription , price , peso , stock , Featured , Weight , Picture1 , Picture2 , SubCategory_idSubCategory , DateTimeRegister , AR , PictureMap , order from Product WHERE id=?", withArgumentsInArray: [e.id])
	        let obj : Product = Product()
	        if (resultSet != nil) {       		
	        		  obj.id = resultSet.intForColumn("id")	        		       		  
	        		  obj.name = resultSet.stringForColumn("name")	        		       		  
	        		  obj.description = resultSet.stringForColumn("description")	        		       		  
	        		  obj.shortDescription = resultSet.stringForColumn("shortDescription")	        		       		  
	        		  obj.price = resultSet.floatForColumn("price")	        		       		  
	        		  obj.peso = resultSet.floatForColumn("peso")	        		       		  
	        		  obj.stock = resultSet.intForColumn("stock")	        		       		  
	        		  obj.Featured = resultSet.boolForColumn("Featured")	        		       		  
	        		  obj.Weight = resultSet.floatForColumn("Weight")	        		       		  
	        		  obj.Picture1 = resultSet.stringForColumn("Picture1")	        		       		  
	        		  obj.Picture2 = resultSet.stringForColumn("Picture2")	        		       		  
	        		  obj.SubCategory_idSubCategory = resultSet.intForColumn("SubCategory_idSubCategory")	        		       		  
	        		  obj.DateTimeRegister = resultSet.dateTimeForColumn("DateTimeRegister")	        		       		  
	        		  obj.AR = resultSet.boolForColumn("AR")	        		       		  
	        		  obj.PictureMap = resultSet.stringForColumn("PictureMap")	        		       		  
	        		  obj.order = resultSet.OrderForColumn("order")	        		       		  
	        }
            sharedInstance.database!.close()
            return obj
}

func InsertObject(e: OrderFinalized)  -> String{

        var db: OpaquePointer?
        db = Connection.openConnection()        
        var statement: OpaquePointer?	
        
        if sqlite3_prepare_v2(db, "insert into product (id, valueTotal, client_idClients, dateTime, zipCodeDelivery_idZipCodeDelivery, valueChange, payment_idPayment, statusOrdered, statusOrderLocal, note, tableNumber, checkout, primaryKey, user) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
              
        if sqlite3_bind_int(statement, 1, e.id, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding id: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.valueTotal, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding valueTotal: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.client_idClients, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding client_idClients: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.dateTime, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding dateTime: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.zipCodeDelivery_idZipCodeDelivery, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding zipCodeDelivery_idZipCodeDelivery: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.valueChange, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding valueChange: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.payment_idPayment, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding payment_idPayment: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.statusOrdered, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding statusOrdered: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.statusOrderLocal, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding statusOrderLocal: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.note, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding note: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.tableNumber, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding tableNumber: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.checkout, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding checkout: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.primaryKey, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding primaryKey: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.user, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding user: \(errmsg)")
        }        
	    
	    var result: String = ""
        if sqlite3_step(statement) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting table: \(errmsg)")
            result = errmsg
        }else{
        	result="Data inserted into database successfully!"
        }    
	    return result
}

func DeleteObject(e: OrderFinalized)  -> String{
       
            string result;
            sharedInstance.database!.open()
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM OrderFinalized WHERE id=?", withArgumentsInArray: [e.id])
            sharedInstance.database!.close()
	        if (isDeleted){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}


}
