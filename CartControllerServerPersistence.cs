
public class CartControllerServerPersistence {

    
   public List<Order> dataListOrder = new List<Order>();
	
   public ActionResult Order(int? sessionId, int? idProd, int? quant){   	
   	
 	   populateList(sessionId.Value, idProd.Value, quant.Value);
   	
	   return View(dataListOrder);	   
	
  }

public void populateList(int sessionId, int idProd, int quant) {
   Order objOrder = new Order();
   objOrder.setProduct_idProduct(idProd);
   objOrder.setSectionClient(sessionId);
   objOrder.setQuantity(quant);
   OrderDAO objOrderDAO = new OrderDAO();
   String result;

   if (idProd!=0 && quant!=0){
         result = objOrderDAO.InsertObject(objOrder);
   }
   List<Order> listOrder  = new List<Order>();
   String ord;
   ord = "Order by id";
   listOrder = objOrderDAO.SelectObject(ord);
   List<Order> listOrderSession  = new List<Order>();
   listOrderSession = OrderListSession(sessionId, listOrder);
   dataListOrder = insertDataListOrder(listOrderSession);
}

public List<Order> OrderListSession(int sessionId, List<Order> listOrder) {
   int x;
   List<Order> listOrderSession  = new List<Order>();
   Order objOrder = new Order();

   for (x=0;x<listOrder.Count;x++){
         objOrder = listOrder.ElementAt(x);
      
   if (objOrder.SectionUser==SessionId){
         listOrderSession.Add(objOrder);
   }
   }

   return listOrderSession;
}

public List<Order> insertDataListOrder(List<Order> listOrder) {
   int x;
   ProductDAO objProdDao = new ProductDAO();
   List<Order> listOrderProduct  = new List<Order>();
   Order objOrder = new Order();
   Product objProduct = new Product();

   for (x=0;x<listOrder.Count;x++){
         objOrder = listOrder.ElementAt(x);
         objProduct = objProdDao.SelectSpecificIdObject(objProduct, objOrder);
         objOrder.setName(objProduct.name);
         objOrder.setPrice(objProduct.price);
         listOrderProduct.Add(objOrder);
   }

   return listOrderProduct;
}


}
