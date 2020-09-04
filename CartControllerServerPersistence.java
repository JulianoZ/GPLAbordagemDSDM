
public class CartControllerServerPersistence {

  
	 public List<Order> dataListOrder = new ArrayList<Order>();
	   
	 
	  
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order);    
        
        
        //Declaration of variable in case to get variable from another screen
        Intent intent = getIntent();
        Order objOrder = (Order) Objects.requireNonNull(intent.getExtras()).get("order");
     	int sessionId = objOrder.getSessionId();
     	int idProd = objOrder.getIdProd();
     	int quant = objOrder.getQuant();

         populateList(sessionId, idProd, quant);

     
         //Instantiate the adapter in case get variable from another screen       
        ListView listView;
        listView = findViewById(R.id.list_view);         
        OrderAdapter adapter = new OrderAdapter(CartControllerServerPersistence.this, dataListOrder);        
        listView.setAdapter(adapter);
     
     
     
     
     
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
   List<Order> listOrder  = new ArrayList<Order>();
   String ord;
   ord = "Order by id";
   listOrder = objOrderDAO.SelectObject(ord);
   List<Order> listOrderSession  = new ArrayList<Order>();
   listOrderSession = OrderListSession(sessionId, listOrder);
   dataListOrder = insertDataListOrder(listOrderSession);
}

public List<Order> OrderListSession(int sessionId, List<Order> listOrder) {
   int x;
   List<Order> listOrderSession  = new ArrayList<Order>();
   Order objOrder = new Order();

   for (x=0;x<listOrder.size();x++){
         objOrder = listOrder.get(x);
      
   if (objOrder.SectionUser==SessionId){
         listOrderSession.add(objOrder);
   }
   }

   return listOrderSession;
}

public List<Order> insertDataListOrder(List<Order> listOrder) {
   int x;
   ProductDAO objProdDao = new ProductDAO();
   List<Order> listOrderProduct  = new ArrayList<Order>();
   Order objOrder = new Order();
   Product objProduct = new Product();

   for (x=0;x<listOrder.size();x++){
         objOrder = listOrder.get(x);
         objProduct = objProdDao.SelectSpecificIdObject(objProduct, objOrder);
         objOrder.setName(objProduct.name);
         objOrder.setPrice(objProduct.price);
         listOrderProduct.add(objOrder);
   }

   return listOrderProduct;
}


}
