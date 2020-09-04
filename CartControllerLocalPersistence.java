
public class CartControllerLocalPersistence {


    View myView;
    
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
    }	

public Order onViewCreated(Bundle savedInstanceState){
   OrderDAO objOrderDAO = new OrderDAO();
   List<Order> listOrder  = new ArrayList<Order>();
   String ord;
   ord = "Order by id";
   listOrder = objOrderDAO.SelectObject(ord);
   listOrder = insertDataListOrder(listOrder);

        super.onViewCreated(view, savedInstanceState);
        getActivity().setTitle("Order");
        OrderAdapter adapter = new OrderAdapter(
                getActivity(),
                R.layout.Order.item_file,
                listOrder);

        ListView lv = (ListView)getView().findViewById(R.id.Order_list);
        lv.setAdapter(adapter);	
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
         objOrder.name = objProduct.name;
         objOrder.price = objProduct.price;
         listOrderProduct.add(objOrder);
   }

   return listOrderProduct;
}


}
