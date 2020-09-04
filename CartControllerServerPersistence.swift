
class CartControllerServerPersistence {


    
    @IBOutlet weak var dataTableView: UITableView!  //reference to tableView from storyBoarding
    private var touchedIndex: Int?                  //reference to row selected 
    
	   var dataListOrder = [Order]()    //reference to list populating the table     	   
 
         //Declaration of variable in case to get variable from another screen 
     	var sessionId: Int?
     	var idProd: Int?
     	var quant: Int?
    
                      

    override func viewDidLoad() {
        super.viewDidLoad()        
         populateList(sessionId: sessionId, idProd: idProd, quant: quant)
        
        
        dataTableView.delegate = self
        dataTableView.dataSource = self   
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCustomTableViewCell", for: indexPath) as! OrderCustomTableViewCell
	         cell.name.text = dataListOrder[indexPath.row].name        
	         cell.price.text = dataListOrder[indexPath.row].price        
	         cell.Quantity.text = dataListOrder[indexPath.row].Quantity        
        return cell
     }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.touchedIndex = indexPath.row
        
        self.performSegue(withIdentifier: "showAnyViewBySegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "showAnyViewBySegue"){
            let controller: AnyViewController = segue.destination as! AnyViewController
            controller.selectedIndex = touchedIndex
            if touchedIndex != nil{
                  controller.name = dataListOrder[touchedIndex!].name
                  controller.price = dataListOrder[touchedIndex!].price
                  controller.Quantity = dataListOrder[touchedIndex!].Quantity
            }
        }
    }    

    

	

func  populateList(sessionId: Int, idProd: Int, quant: Int)  -> Void {
   let objOrder =  Order()	     
   objOrder.setProduct_idProduct(idProd: idProd)	  
   objOrder.setSectionClient(sessionId: sessionId)	  
   objOrder.setQuantity(quant: quant)	  
   let objOrderDAO =  OrderDAO()	     
   var result: String	     

   if (idProd!=0 && quant!=0){
         result = objOrderDAO.InsertObject(objOrder)
   }
   listOrder = [Order]()
   var ord: String	     
   ord = "Order by id"
   listOrder = objOrderDAO.SelectObject(ord: ord)
   listOrderSession = [Order]()
   listOrderSession = OrderListSession(sessionId: sessionId, listOrder: listOrder)
   dataListOrder = insertDataListOrder(listOrderSession: listOrderSession)
}
func  OrderListSession(sessionId: Int, listOrder: [Order])  -> [Order] {
   var x: Int	     
   listOrderSession = [Order]()
   let objOrder =  Order()	     
   x=0
   while x<listOrder.size {
      objOrder = listOrder.get(x)
   
   if (objOrder.SectionUser==SessionId){
         listOrderSession.append(objOrder: objOrder)	  
   }
   x+=1
   }

   return listOrderSession
}
func  insertDataListOrder(listOrder: [Order])  -> [Order] {
   var x: Int	     
   let objProdDao =  ProductDAO()	     
   listOrderProduct = [Order]()
   let objOrder =  Order()	     
   let objProduct =  Product()	     
   x=0
   while x<listOrder.size {
      objOrder = listOrder.get(x)
      objProduct = objProdDao.SelectSpecificIdObject(objProduct: objProduct, objOrder: objOrder)
      objOrder.setName(name: objProduct.name)	  
      objOrder.setPrice(price: objProduct.price)	  
      listOrderProduct.append(objOrder: objOrder)	  
   x+=1
   }

   return listOrderProduct
}

}
