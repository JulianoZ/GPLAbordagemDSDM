
public class OrderFinalizedAdm {

  
	 public List<OrderFinalized> dataListOrderFinalized = new ArrayList<OrderFinalized>();
	   
	 
	  
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_orderFinalized);    
        
        
        //Declaration of variable in case to get variable from another screen
        Intent intent = getIntent();
        OrderFinalized objOrderFinalized = (OrderFinalized) Objects.requireNonNull(intent.getExtras()).get("orderFinalized");
     	int idOrderedFinalized = objOrderFinalized.getIdOrderedFinalized();
     	int statusOrdered = objOrderFinalized.getStatusOrdered();

         populateList(idOrderedFinalized, statusOrdered);

     
         //Instantiate the adapter in case get variable from another screen       
        ListView listView;
        listView = findViewById(R.id.list_view);         
        OrderFinalizedAdapter adapter = new OrderFinalizedAdapter(OrderFinalizedController.this, dataListOrderFinalized);        
        listView.setAdapter(adapter);
     
     
     
     
     
    }

public void populateList(int idOrderedFinalized, int statusOrdered) {
   OrderFinalizedDAO objOrderFinalizedDAO = new OrderFinalizedDAO();
   List<OrderFinalized> listOrderFinalized  = new ArrayList<OrderFinalized>();
   String ord;
   ord = "Order by id desc";
   listOrderFinalized = objOrderFinalizedDAO.SelectObject(ord);
   adjustStatusOrder(idOrderedFinalized, statusOrdered, listOrderFinalized);
   dataListOrderFinalized = insertDataListOrder(listOrderFinalized);
}

public List<Order> insertDataListOrder(List<OrderFinalized> listOrderFinalized) {
   int x;
   List<OrderFinalized> listOrderFin  = new ArrayList<OrderFinalized>();
   UserDAO objUserDao = new UserDAO();
   User objUser = new User();
   OrderFinalized objOrderFinalized = new OrderFinalized();

   for (x=0;x<listOrderFinalized.size();x++){
         objOrderFinalized = listOrderFinalized.get(x);
         objUser = objUserDao.SelectSpecificIdObject(objUser, objOrderFinalized);
         objOrderFinalized.setUser(objUser);
         listOrderFin.add(objOrderFinalized);
   }

   return listOrderFin;
}

public void adjustStatusOrder(int idOrderedFinalized, int statusOrdered, List<OrderFinalized> listOrderFinalized) {
   String result;

   if ((idOrderedFinalized!=0)){
         int x;
         OrderFinalized objOF = new OrderFinalized();
         OrderFinalizedDAO objFDao = new OrderFinalizedDAO();
      
   for (x=0;x<listOrderFinalized.size();x++){
         objOF = listOrderFinalized.get(x);
      
   if (objOF.idOrderedFinalized==idOrderedFinalized){
         int statusOr;
         statusOr = adjustStatus(statusOrdered);
         objOF.setStatusOrdered(statusOr);
         result = objFDao.UpdateObject(objOF);
   }
   }

   }
}

public Integer adjustStatus(int CurrentStatusOrder) {
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
