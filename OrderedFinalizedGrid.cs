
public class OrderedFinalizedGrid {

public ActionResult onViewCreated(int idOrderFin, int CurrentStatusOrder){
   OrderFinalizedDAO objFDao = new OrderFinalizedDAO();
   OrderFinalized objOF = new OrderFinalized();
   List<OrderFinalized> listOrder  = new List<OrderFinalized>();
   String ord;
   ord = "";
   String result;
   List<OrderFinalized> listOrderF  = new List<OrderFinalized>();

   if ((idOrderFin!=0)){
         String ord;
         ord = "";
         int x;
      listOrderF=objFDao.SelectObject(ord)
      
   for (x=0;x<listOrderF.Count;x++){
         objOF = listOrderF.ElementAt(x);
      
   if (objOF.idOrderedFinalized==idOrderFin){
         objOF.idOrderedFinalized = idOrderFin;
         objOF.statusOrdered = adjustStatus(CurrentStatusOrder);
         result = objFDao.UpdateObject(objOF);
      
   if (objOF.statusOrderLocal==1){
         Order objO = new Order();
         objO = getObjectOrder(idOrderFin);
         objO.ProductDelivered = 0;
         objO.id = idOrderFin;
         result = objFDao.UpdateObject(objO);
   }
   }
   }

   }

	
	   return View(listOrderFinalized);	   
	
	

}

public Order getObjectOrder(int id) {
   Order objO = new Order();
   OrderDAO objODAO = new OrderDAO();
   List<Order> listOrder  = new List<Order>();
   String ord;
   ord = "";
   int x;
   listOrder = objODAO.SelectObject(ord);

   for (x=0;x<listOrder.Count;x++){
         objO = listOrder.ElementAt(x);
      
   if (objO.id==id){
         break;
   }
   }

   return objO;
}

public int adjustStatus(int CurrentStatusOrder) {
   int status;
   status = 0;

   if ((CurrentStatusOrder==0)){
         status = 1;
   }
   else if((CurrentStatusOrder==1)){
         status = 2;
   }
   else if((CurrentStatusOrder==2)){
         status = 3;
   }
   else if((CurrentStatusOrder==3)){
         status = 4;
   }

   return status;
}


}
