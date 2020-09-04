
public class OrderFinalizedAdm {

    
   public List<OrderFinalized> dataListOrderFinalized = new List<OrderFinalized>();
	
   public ActionResult OrderFinalized(int? idOrderedFinalized, int? statusOrdered){   	
   	
 	   populateList(idOrderedFinalized.Value, statusOrdered.Value);
   	
	   return View(dataListOrderFinalized);	   
	
  }

public void populateList(int idOrderedFinalized, int statusOrdered) {
   OrderFinalizedDAO objOrderFinalizedDAO = new OrderFinalizedDAO();
   List<OrderFinalized> listOrderFinalized  = new List<OrderFinalized>();
   String ord;
   ord = "Order by id desc";
   listOrderFinalized = objOrderFinalizedDAO.SelectObject(ord);
   adjustStatusOrder(idOrderedFinalized, statusOrdered, listOrderFinalized);
   dataListOrderFinalized = insertDataListOrder(listOrderFinalized);
}

public List<Order> insertDataListOrder(List<OrderFinalized> listOrderFinalized) {
   int x;
   List<OrderFinalized> listOrderFin  = new List<OrderFinalized>();
   UserDAO objUserDao = new UserDAO();
   User objUser = new User();
   OrderFinalized objOrderFinalized = new OrderFinalized();

   for (x=0;x<listOrderFinalized.Count;x++){
         objOrderFinalized = listOrderFinalized.ElementAt(x);
         objUser = objUserDao.SelectSpecificIdObject(objUser, objOrderFinalized);
         objOrderFinalized.setUser(objUser);
         listOrderFin.Add(objOrderFinalized);
   }

   return listOrderFin;
}

public void adjustStatusOrder(int idOrderedFinalized, int statusOrdered, List<OrderFinalized> listOrderFinalized) {
   String result;

   if ((idOrderedFinalized!=0)){
         int x;
         OrderFinalized objOF = new OrderFinalized();
         OrderFinalizedDAO objFDao = new OrderFinalizedDAO();
      
   for (x=0;x<listOrderFinalized.Count;x++){
         objOF = listOrderFinalized.ElementAt(x);
      
   if (objOF.idOrderedFinalized==idOrderedFinalized){
         int statusOr;
         statusOr = adjustStatus(statusOrdered);
         objOF.setStatusOrdered(statusOr);
         result = objFDao.UpdateObject(objOF);
   }
   }

   }
}

public int adjustStatus(int CurrentStatusOrder) {
   int status;
   status = 0;

   if (CurrentStatusOrder==0){
         status = 1;
   }
   else if(CurrentStatusOrder==1){
         status = 2;
   }
   else if(CurrentStatusOrder==2){
         status = 3;
   }
   else if(CurrentStatusOrder==3){
         status = 4;
   }

   return status;
}


}
