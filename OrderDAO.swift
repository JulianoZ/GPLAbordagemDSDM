
class OrderDAO {

init(j: String, id: Int) {
}
func  addValues(v1: Int, v2: Int)  -> Int {
   var total: Int	     
   total = v1+v2
   return total
}
func  teste(id: Int, j: String)  -> String {
   let objProd =  Product()	     
   var teste: String	     
   teste = 20
   listOrder = [Order]()
   listNumW = [Int, float]()
   listNumW3 = [String]()
   list2 = [List]()

   listNumW3 = 3
   listNumW3.append(teste: teste)	  
   teste = objProd.getNome()
   var z: Int	     
   z = 0
   var using: String	     

   while (z<listNumW3.size){
         using = listNumW3[2]
   }

   var z: Int	     
   z=10
   while z<1 {
   
   if ((z==2)){
         z = 9
   }
      e = z+1
   z-=1
   }

   var x4: Int	     
   var v: Int	     
   v=1
   while v>10 {
      x4 = x4+1
   v=v+3
   }


   while (z<10){
         e = 5+2
   }


   repeat {
         e = 5+9
   }while(z<10)


   if (z<10 && z<20){
         e = 200+20
   }
   else if(z<10){
         e = 5+9
   }
   else{
         e = 5+43
   }

   return teste
}
 private var id: Int = 0


 public func  getId()  -> Int { 
  return self.id
 }

 public func setId(id: Int) {
  self.id = id
 }
 private var name: String = ""


 public func  getName()  -> String { 
  return self.name
 }

 public func setName(name: String) {
  self.name = name
 }
 private var description: String = ""


 public func  getDescription()  -> String { 
  return self.description
 }

 public func setDescription(description: String) {
  self.description = description
 }
 private var shortDescription: String = ""


 public func  getShortDescription()  -> String { 
  return self.shortDescription
 }

 public func setShortDescription(shortDescription: String) {
  self.shortDescription = shortDescription
 }
func UpdateObject(e: Order)  -> String{
      
	        string result;
	        sharedInstance.database!.open()
	        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE Order SET Product_idProduct = ?  , product = ?  , ValueUnit = ?  , Quantity = ?  , ValueTotal = ?  , SectionClient = ?  , OrderFinalized = ?  , DateTimeOrder = ?  , StatusFinalized = ?  , OrderFinalized_idOrderFinalized = ?  , ProductDelivered = ?  WHERE id = ?", withArgumentsInArray: [e.Product_idProduct, e.product, e.ValueUnit, e.Quantity, e.ValueTotal, e.SectionClient, e.OrderFinalized, e.DateTimeOrder, e.StatusFinalized, e.OrderFinalized_idOrderFinalized, e.ProductDelivered, e.id])
	        sharedInstance.database!.close()
	        if (isUpdated){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

func SelectObject(ord: string)  -> [Order]{
     sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , Product_idProduct , product , ValueUnit , Quantity , ValueTotal , SectionClient , OrderFinalized , DateTimeOrder , StatusFinalized , OrderFinalized_idOrderFinalized , ProductDelivered from Order", withArgumentsInArray: nil)
	        let listOrder : NSMutableArray = NSMutableArray()
	        if (resultSet != nil) {
	        	while resultSet.next() {
	        		let obj : Order = Order()
	        		obj.id = resultSet.intForColumn("id")	        		       		  
	        		obj.Product_idProduct = resultSet.intForColumn("Product_idProduct")	        		       		  
	        		obj.product = resultSet.ProductForColumn("product")	        		       		  
	        		obj.ValueUnit = resultSet.floatForColumn("ValueUnit")	        		       		  
	        		obj.Quantity = resultSet.intForColumn("Quantity")	        		       		  
	        		obj.ValueTotal = resultSet.floatForColumn("ValueTotal")	        		       		  
	        		obj.SectionClient = resultSet.stringForColumn("SectionClient")	        		       		  
	        		obj.OrderFinalized = resultSet.stringForColumn("OrderFinalized")	        		       		  
	        		obj.DateTimeOrder = resultSet.dateTimeForColumn("DateTimeOrder")	        		       		  
	        		obj.StatusFinalized = resultSet.boolForColumn("StatusFinalized")	        		       		  
	        		obj.OrderFinalized_idOrderFinalized = resultSet.intForColumn("OrderFinalized_idOrderFinalized")	        		       		  
	        		obj.ProductDelivered = resultSet.boolForColumn("ProductDelivered")	        		       		  
	        		listOrder.addObject(obj)
	        	}
	        }
            sharedInstance.database!.close()
            return listOrder
}

func SelectSpecificIdObject(e: Order, id: int)  -> Order{
    	   
	        sharedInstance.database!.open()
	        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT id , Product_idProduct , product , ValueUnit , Quantity , ValueTotal , SectionClient , OrderFinalized , DateTimeOrder , StatusFinalized , OrderFinalized_idOrderFinalized , ProductDelivered from Order WHERE id=?", withArgumentsInArray: [e.id])
	        let obj : Order = Order()
	        if (resultSet != nil) {       		
	        		  obj.id = resultSet.intForColumn("id")	        		       		  
	        		  obj.Product_idProduct = resultSet.intForColumn("Product_idProduct")	        		       		  
	        		  obj.product = resultSet.ProductForColumn("product")	        		       		  
	        		  obj.ValueUnit = resultSet.floatForColumn("ValueUnit")	        		       		  
	        		  obj.Quantity = resultSet.intForColumn("Quantity")	        		       		  
	        		  obj.ValueTotal = resultSet.floatForColumn("ValueTotal")	        		       		  
	        		  obj.SectionClient = resultSet.stringForColumn("SectionClient")	        		       		  
	        		  obj.OrderFinalized = resultSet.stringForColumn("OrderFinalized")	        		       		  
	        		  obj.DateTimeOrder = resultSet.dateTimeForColumn("DateTimeOrder")	        		       		  
	        		  obj.StatusFinalized = resultSet.boolForColumn("StatusFinalized")	        		       		  
	        		  obj.OrderFinalized_idOrderFinalized = resultSet.intForColumn("OrderFinalized_idOrderFinalized")	        		       		  
	        		  obj.ProductDelivered = resultSet.boolForColumn("ProductDelivered")	        		       		  
	        }
            sharedInstance.database!.close()
            return obj
}

func InsertObject(e: Order)  -> String{

        var db: OpaquePointer?
        db = Connection.openConnection()        
        var statement: OpaquePointer?	
        
        if sqlite3_prepare_v2(db, "insert into product (id, Product_idProduct, product, ValueUnit, Quantity, ValueTotal, SectionClient, OrderFinalized, DateTimeOrder, StatusFinalized, OrderFinalized_idOrderFinalized, ProductDelivered) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, &statement, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
        }
              
        if sqlite3_bind_int(statement, 1, e.id, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding id: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.Product_idProduct, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Product_idProduct: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.product, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding product: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.ValueUnit, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding ValueUnit: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.Quantity, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Quantity: \(errmsg)")
        }        
        if sqlite3_bind_double(statement, 1, e.ValueTotal, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding ValueTotal: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.SectionClient, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding SectionClient: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.OrderFinalized, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding OrderFinalized: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.DateTimeOrder, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding DateTimeOrder: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.StatusFinalized, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding StatusFinalized: \(errmsg)")
        }        
        if sqlite3_bind_int(statement, 1, e.OrderFinalized_idOrderFinalized, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding OrderFinalized_idOrderFinalized: \(errmsg)")
        }        
        if sqlite3_bind_text(statement, 1, e.ProductDelivered, -1, SQLITE_TRANSIENT) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding ProductDelivered: \(errmsg)")
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

func DeleteObject(e: Order)  -> String{
       
            string result;
            sharedInstance.database!.open()
            let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM Order WHERE id=?", withArgumentsInArray: [e.id])
            sharedInstance.database!.close()
	        if (isDeleted){
	        	result="Data updated into database successfully!"
	        }else{
	        	result="Error"
	        }
	        return result
}

 private var products = [Product, int]()

func  getHashMapProducts()  -> [ProductInt] {
   return products
}
func  addHashMapProducts(p: Product, quantity: Int)  -> Void {
   products.put(p: p, quantity: quantity)	  
}
func  OrderInsertCart(idProd: Int, quantity: Int, sectionClient: Int)  -> String {
   let objO =  Order()	     
   let objProd =  ProductDAO()	     
   var NewQuant: Int	     
   var result: String	     
   listOrder = [Order]()
   var x: Int	     
   var ord: String	     
   ord = "order by id ASC"
   var id: Int	     
   id = idProd
   listOrder = SelectObject(ord: ord)
   x=0
   while x<listOrder.size {
      objO = listOrder.get(x)
   
   if (objO.SectionUser==sectionUser && objO.Product_idProduct==idProd){
         objO.id = objO.id
         objO.NewQuant = objO.Quantity+1
         objO.ValueTotal = objO.ValueUnit*NewQuant
         result = UpdateObject(objO: objO)
   }   else{
      objProd=objProd.SelectSpecificIdObject(objProd: objProd, id: id)
         objO.Product_idProduct = objProd.id
         objO.ValueUnit = objProd.Price
         objO.Quantity = quant
         objO.ValueTotal = (quant*objProd.Price)
         objO.SectionUser = sectionUser
         result = InsertObject(objO: objO)
   }

   x+=1
   }

   return result
}
func  CalculateTotalValuePurchase(SessionId: String)  -> Float {
   var TotalValue: Float	     
   ListOrd = [Order]()
   let objO =  Order()	     
   var x: Int	     
   var ord: String	     
   ord = "Order by Product_idProduct ASC "
   ListOrd = SelectObject(ord: ord)
   x=0
   while x<listOrder.size {
      objO = ListOrd.get(x)
   
   if (objO.SectionUser==SessionId && objO.StatusFinalized==1){
      TotalValue+=objO.ValueTotal
   }
      return TotalValue
   x+=1
   }

}

}
