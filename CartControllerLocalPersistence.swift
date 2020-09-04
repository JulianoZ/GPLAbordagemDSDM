
class CartControllerLocalPersistence {


    var listOrder : [String]?
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var resultsTableView : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
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
      objOrder.name = objProduct.name
      objOrder.price = objProduct.price
      listOrderProduct.append(objOrder: objOrder)	  
   x+=1
   }

   return listOrderProduct
}

}
