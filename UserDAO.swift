
class UserDAO {

func UpdateObject(e: User)  -> String{
      
	        string result;
	        sharedInstance.database!.open()
	        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE User SET name = ?  , email = ?  , password = ?  , phone = ?  , cellPhone = ?  , ZipCodeDelivery_idZipCodeDelivery = ?  , number = ?  , complement = ?  , statusUser = ?  , dataTime = ?  WHERE id = ?", withArgumentsInArray: [e.name, e.email, e.password, e.phone, e.cellPhone, e.ZipCodeDelivery_idZipCodeDelivery, e.number, e.complement, e.statusUser, e.dataTime, e.id])
	        sharedInstance.database!.close()
	        if (isUpdated){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

func SelectObject(ord: string)  -> [User]{
     sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , name , email , password , phone , cellPhone , ZipCodeDelivery_idZipCodeDelivery , number , complement , statusUser , dataTime from User", withArgumentsInArray: nil)
	        let listUser : NSMutableArray = NSMutableArray()
	        if (resultSet != nil) {
	        	while resultSet.next() {
	        		let obj : User = User()
	        		obj.id = resultSet.intForColumn("id")	        		       		  
	        		obj.name = resultSet.stringForColumn("name")	        		       		  
	        		obj.email = resultSet.stringForColumn("email")	        		       		  
	        		obj.password = resultSet.stringForColumn("password")	        		       		  
	        		obj.phone = resultSet.stringForColumn("phone")	        		       		  
	        		obj.cellPhone = resultSet.stringForColumn("cellPhone")	        		       		  
	        		obj.ZipCodeDelivery_idZipCodeDelivery = resultSet.intForColumn("ZipCodeDelivery_idZipCodeDelivery")	        		       		  
	        		obj.number = resultSet.stringForColumn("number")	        		       		  
	        		obj.complement = resultSet.stringForColumn("complement")	        		       		  
	        		obj.statusUser = resultSet.boolForColumn("statusUser")	        		       		  
	        		obj.dataTime = resultSet.dateTimeForColumn("dataTime")	        		       		  
	        		listUser.addObject(obj)
	        	}
	        }
            sharedInstance.database!.close()
            return listUser
}

func SelectSpecificIdObject(e: User, id: int)  -> User{
    	   
	        sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , name , email , password , phone , cellPhone , ZipCodeDelivery_idZipCodeDelivery , number , complement , statusUser , dataTime from User WHERE id=?", withArgumentsInArray: [e.id])
	        let obj : User = User()
	        if (resultSet != nil) {       		
	        		  obj.id = resultSet.intForColumn("id")	        		       		  
	        		  obj.name = resultSet.stringForColumn("name")	        		       		  
	        		  obj.email = resultSet.stringForColumn("email")	        		       		  
	        		  obj.password = resultSet.stringForColumn("password")	        		       		  
	        		  obj.phone = resultSet.stringForColumn("phone")	        		       		  
	        		  obj.cellPhone = resultSet.stringForColumn("cellPhone")	        		       		  
	        		  obj.ZipCodeDelivery_idZipCodeDelivery = resultSet.intForColumn("ZipCodeDelivery_idZipCodeDelivery")	        		       		  
	        		  obj.number = resultSet.stringForColumn("number")	        		       		  
	        		  obj.complement = resultSet.stringForColumn("complement")	        		       		  
	        		  obj.statusUser = resultSet.boolForColumn("statusUser")	        		       		  
	        		  obj.dataTime = resultSet.dateTimeForColumn("dataTime")	        		       		  
	        }
            sharedInstance.database!.close()
            return obj
}

func InsertObject(e: User)  -> String{

        var db: OpaquePointer?
        db = Connection.openConnection()        
        var statement: OpaquePointer?	
        
        if sqlite3_prepare_v2(db, "insert into product (id, name, email, password, phone, cellPhone, ZipCodeDelivery_idZipCodeDelivery, number, complement, statusUser, dataTime) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
              
        if sqlite3_bind_int(statement, 1, e.id, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding id: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.name, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.email, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding email: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.password, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.phone, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.cellPhone, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding cellPhone: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.ZipCodeDelivery_idZipCodeDelivery, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding ZipCodeDelivery_idZipCodeDelivery: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.number, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding number: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.complement, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding complement: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.statusUser, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding statusUser: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.dataTime, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding dataTime: \(errmsg)")
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

func DeleteObject(e: User)  -> String{
       
            string result;
            sharedInstance.database!.open()
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM User WHERE id=?", withArgumentsInArray: [e.id])
            sharedInstance.database!.close()
	        if (isDeleted){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

func  AuthenticationCli(cli: User)  -> [String] {
   let objCl =  User()	     
   accessData = [String]()
   listObjCli = [User]()
   var ord: String	     
   ord = "Order by id"
   listObjCli = SelectObject(ord: ord)
   var x: Int	     
   var status: Bool	     
   x=0
   while x<listObjCli.size {
      objCl = listObjCli.get(x)
   
   if (objCl.email==cli.email && objCl.password==cli.password){
         status = "true"
         accessData.append(id: objCli.id)	  
         accessData.append(name: objCli.name)	  
         accessData.append(status: status)	  
   }   else{
         status = "false"
         objCl.name = "Error"
         accessData.append(name: objCl.name)	  
         accessData.append(status: status)	  
   }

   x+=1
   }

   return accessData
}

}
