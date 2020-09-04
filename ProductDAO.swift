
class ProductDAO {

func UpdateObject(e: Product)  -> String{
      
	        string result;
	        sharedInstance.database!.open()
	        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE Product SET name = ?  , description = ?  , shortDescription = ?  , price = ?  , peso = ?  , stock = ?  , Featured = ?  , Weight = ?  , Picture1 = ?  , Picture2 = ?  , SubCategory_idSubCategory = ?  , DateTimeRegister = ?  , AR = ?  , PictureMap = ?  , order = ?  WHERE id = ?", withArgumentsInArray: [e.name, e.description, e.shortDescription, e.price, e.peso, e.stock, e.Featured, e.Weight, e.Picture1, e.Picture2, e.SubCategory_idSubCategory, e.DateTimeRegister, e.AR, e.PictureMap, e.order, e.id])
	        sharedInstance.database!.close()
	        if (isUpdated){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

func SelectObject(ord: string)  -> [Product]{
     sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , name , description , shortDescription , price , peso , stock , Featured , Weight , Picture1 , Picture2 , SubCategory_idSubCategory , DateTimeRegister , AR , PictureMap , order from Product", withArgumentsInArray: nil)
	        let listProduct : NSMutableArray = NSMutableArray()
	        if (resultSet != nil) {
	        	while resultSet.next() {
	        		let obj : Product = Product()
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
	        		listProduct.addObject(obj)
	        	}
	        }
            sharedInstance.database!.close()
            return listProduct
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

func InsertObject(e: Product)  -> String{

        var db: OpaquePointer?
        db = Connection.openConnection()        
        var statement: OpaquePointer?	
        
        if sqlite3_prepare_v2(db, "insert into product (id, name, description, shortDescription, price, peso, stock, Featured, Weight, Picture1, Picture2, SubCategory_idSubCategory, DateTimeRegister, AR, PictureMap, order) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
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
        if sqlite3_bind_text(statement, 1, e.description, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding description: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.shortDescription, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding shortDescription: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.price, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding price: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.peso, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding peso: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.stock, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding stock: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.Featured, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Featured: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.Weight, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Weight: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.Picture1, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Picture1: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.Picture2, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Picture2: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.SubCategory_idSubCategory, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding SubCategory_idSubCategory: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.DateTimeRegister, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding DateTimeRegister: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.AR, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding AR: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.PictureMap, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding PictureMap: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.order, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding order: \(errmsg)")
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

func DeleteObject(e: Product)  -> String{
       
            string result;
            sharedInstance.database!.open()
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM Product WHERE id=?", withArgumentsInArray: [e.id])
            sharedInstance.database!.close()
	        if (isDeleted){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

func  ProductListSpecificSubCat(idSubCat: Int)  -> [Product] {
   let objProd =  Product()	     
   listObjProd = [Product]()
   listObjProdSpec = [Product]()
   var ord: String	     
   ord = "Order by name"
   listObjProd = SelectObject(ord: ord)
   var x: Int	     
   x=0
   while x<listObjprod.size {
      objProd = listObjProd.get(x)
   
   if (objProd.SubCategory_idSubCategory==idSubCat){
         listObjprodSpec.append(objProd: objProd)	  
   }
   x+=1
   }

   return listObjProdSpec
}

}
