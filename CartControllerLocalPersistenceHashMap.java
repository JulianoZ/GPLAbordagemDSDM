
public class CartControllerLocalPersistenceHashMap {

  
	 
	  
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order);    
        
        


     
         //Instantiate the adapter in case get variable from another screen       
        ListView listView;
        listView = findViewById(R.id.list_view);         
        OrderAdapter adapter = new OrderAdapter(${val1}.this, );        
        listView.setAdapter(adapter);
     
     
     
     
     
     
     
    }

 private linkedHashMap<Product, Integer> products;

public Order onViewCreated(Bundle savedInstanceState){
   OrderDAO objOrderDAO = new OrderDAO();
   products = objOrderDAO.getHashMapProducts(x);

        super.onViewCreated(view, savedInstanceState);
        getActivity().setTitle("Order");
        OrderAdapter adapter = new OrderAdapter(
                getActivity(),
                R.layout.Order.item_file,
                listOrder);

        ListView lv = (ListView)getView().findViewById(R.id.Order_list);
        lv.setAdapter(adapter);	
}


}
