
public class CartControllerHashMapPersistence {

  
	 public LinkedHashMap<Product, Integer> dataListProduct = new LinkedHashMap<>();
	 
	  
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
        OrderAdapter adapter = new OrderAdapter(CartControllerHashMapPersistence.this, dataListProduct);        
        listView.setAdapter(adapter);
     
     
     
     
     
    }

public void populateList(int sessionId, int idProd, int quant) {
   OrderDAO objOrderDAO = new OrderDAO();

   if (idProd!=0 && quant!=0){
         Product objProduct = new Product();
         objProduct = getProduct(idProd);
         objOrderDAO.addHashMapProducts(objProduct, quant);
   }
   dataListProduct = objOrderDAO.getHashMapProducts();
}

public Product getProduct(int id) {
   Product objProduct = new Product();
   ProductDAO objProductDao = new ProductDAO();
   objProduct = objProductDao.SelectSpecificIdObject(objProduct, id);
   return objProduct;
}


}
