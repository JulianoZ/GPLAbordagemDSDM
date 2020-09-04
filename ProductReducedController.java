
public class ProductReducedController {

  
	 public List<Product> dataListProduct = new ArrayList<Product>();
	   
	 
	  
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product);    
        
        

         populateList();

     
         //Instantiate the adapter in case get variable from another screen       
        ListView listView;
        listView = findViewById(R.id.list_view);         
        ProductAdapter adapter = new ProductAdapter(ProductCrossController.this, dataListProduct);        
        listView.setAdapter(adapter);
     
     
     
     
     
    }

public void populateList() {
   ProductDAO objProd = new ProductDAO();
   String ord;
   ord = "Order by name ";
   dataListProduct = objProd.SelectObject(ord);
}


}
