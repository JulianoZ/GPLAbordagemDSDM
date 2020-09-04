
public class OrderDAO {

public OrderDAO(int id, string j) {
}

public Integer addValues(int v1, int v2) {
   int total;
   total = v1+v2;
   return total;
}

public String teste(int id, string j) {
   Product objProd = new Product();
   String teste;
   teste = 20;
   List<Order> listOrder  = new ArrayList<Order>();
   List<Integer, Float> listNumW  = new ArrayList<Integer, Float>();
   List<String> listNumW3  = new ArrayList<String>();
   list[] list2 = new list[2];
   listNumW3 = 3;
   listNumW3.add(teste);
   teste = objProd.getNome();
   int z;
   z = 0;
   String using;

   while (z<listNumW3.size()){
         using = listNumW3[2];
   }

   int z;

   for (z=10;z<1;z--){
      
   if ((z==2)){
         z = 9;
   }
         e = z+1;
   }

   int x4;
   int v;

   for (v=1;v>10;v=v+3){
         x4 = x4+1;
   }


   while (z<10){
         e = 5+2;
   }


   do {
         e = 5+9;
   }while(z<10);


   if (z<10 && z<20){
         e = 200+20;
   }
   else if(z<10){
         e = 5+9;
   }
   else{
         e = 5+43;
   }

   return teste;
}

 private int id;

 public int getId() {
  return id;
 }

 public void setId(int id) {
  this.id = id;
 }
 private string name;

 public string getName() {
  return name;
 }

 public void setName(string name) {
  this.name = name;
 }
 private string description;

 public string getDescription() {
  return description;
 }

 public void setDescription(string description) {
  this.description = description;
 }
 private string shortDescription;

 public string getShortDescription() {
  return shortDescription;
 }

 public void setShortDescription(string shortDescription) {
  this.shortDescription = shortDescription;
 }
public string UpdateObject(Order e, Context context){
 
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "UPDATE Order SET id = " + e.getId() + ", Product_idProduct = " + e.getProduct_idProduct() + ", product = " + e.getProduct() + ", ValueUnit = " + e.getValueUnit() + ", Quantity = " + e.getQuantity() + ", ValueTotal = " + e.getValueTotal() + ", SectionClient = " + e.getSectionClient() + ", OrderFinalized = " + e.getOrderFinalized() + ", DateTimeOrder = " + e.getDateTimeOrder() + ", StatusFinalized = " + e.getStatusFinalized() + ", OrderFinalized_idOrderFinalized = " + e.getOrderFinalized_idOrderFinalized() + ", ProductDelivered = " + e.getProductDelivered() + " WHERE id = e.id";
	       try{  
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;	
}

public list<Order> SelectObject(string ord, Context context){
     List<Order> listObj = new ArrayList<Order>(); 
            Connection db = Connection.getInstance(context.getApplicationContext());
            String query = "select id, Product_idProduct, product, ValueUnit, Quantity, ValueTotal, SectionClient, OrderFinalized, DateTimeOrder, StatusFinalized, OrderFinalized_idOrderFinalized, ProductDelivered from Order " + ord";
            Cursor c = db.getWritableDatabase().rawQuery(query,null);
            if(c!=null && c.moveToFirst()){
            	do {
            		Order obj = new Order();
            		  obj.setId(Connection.getDataInt("id", c));                 
            		  obj.setProduct_idProduct(Connection.getDataInt("Product_idProduct", c));                 
            		  obj.setProduct(Connection.getDataProduct("product", c));                 
            		  obj.setValueUnit(Connection.getDataFloat("ValueUnit", c));                 
            		  obj.setQuantity(Connection.getDataInt("Quantity", c));                 
            		  obj.setValueTotal(Connection.getDataFloat("ValueTotal", c));                 
            		  obj.setSectionClient(Connection.getDataString("SectionClient", c));                 
            		  obj.setOrderFinalized(Connection.getDataString("OrderFinalized", c));                 
            		  obj.setDateTimeOrder(Connection.getDataDateTime("DateTimeOrder", c));                 
            		  obj.setStatusFinalized(Connection.getDataBool("StatusFinalized", c));                 
            		  obj.setOrderFinalized_idOrderFinalized(Connection.getDataInt("OrderFinalized_idOrderFinalized", c));                 
            		  obj.setProductDelivered(Connection.getDataBool("ProductDelivered", c));                 
            		listObj.add(obj);
            	}while (c.moveToNext());
            	c.close();
            db.close();
            }
            return listObj;
}

public Order SelectSpecificIdObject(Order e, int id, Context context){
    		        
	        Connection db = Connection.getInstance(context.getApplicationContext());
	        String query = "SELECT id, Product_idProduct, product, ValueUnit, Quantity, ValueTotal, SectionClient, OrderFinalized, DateTimeOrder, StatusFinalized, OrderFinalized_idOrderFinalized, ProductDelivered FROM Order WHERE id=" + id;
	        Cursor c = db.getWritableDatabase().rawQuery(query,null);
	        Order obj = new Order();
	        if(c!=null && c.moveToFirst()){	           
                 obj.setId(Connection.getDataInt("id", c));                 
                 obj.setProduct_idProduct(Connection.getDataInt("Product_idProduct", c));                 
                 obj.setProduct(Connection.getDataProduct("product", c));                 
                 obj.setValueUnit(Connection.getDataFloat("ValueUnit", c));                 
                 obj.setQuantity(Connection.getDataInt("Quantity", c));                 
                 obj.setValueTotal(Connection.getDataFloat("ValueTotal", c));                 
                 obj.setSectionClient(Connection.getDataString("SectionClient", c));                 
                 obj.setOrderFinalized(Connection.getDataString("OrderFinalized", c));                 
                 obj.setDateTimeOrder(Connection.getDataDateTime("DateTimeOrder", c));                 
                 obj.setStatusFinalized(Connection.getDataBool("StatusFinalized", c));                 
                 obj.setOrderFinalized_idOrderFinalized(Connection.getDataInt("OrderFinalized_idOrderFinalized", c));                 
                 obj.setProductDelivered(Connection.getDataBool("ProductDelivered", c));                 
               c.close();
               db.close();
            }else{
               obj = null; 
            }
        return obj;	

}

public string InsertObject(Order e, Context context){
      
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "insert into Order (id, Product_idProduct, product, ValueUnit, Quantity, ValueTotal, SectionClient, OrderFinalized, DateTimeOrder, StatusFinalized, OrderFinalized_idOrderFinalized, ProductDelivered) values ('" + e.getId()  + "','" + e.getProduct_idProduct()  + "','" + e.getProduct()  + "','" + e.getValueUnit()  + "','" + e.getQuantity()  + "','" + e.getValueTotal()  + "','" + e.getSectionClient()  + "','" + e.getOrderFinalized()  + "','" + e.getDateTimeOrder()  + "','" + e.getStatusFinalized()  + "','" + e.getOrderFinalized_idOrderFinalized()  + "','" + e.getProductDelivered()  + "')";
	       try{
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;
}

public string DeleteObject(Order e, Context context){
     
	        string result;  
	        Connection db = Connection.getInstance(c.getApplicationContext()); 
	        String query = "DELETE FROM Order WHERE id=" + e.getId();  
	        try{
	        	db.getWritableDatabase().execSQL(query); 
	        	db.close(); 
	        	return="true";
	        }catch(Exception e){ 
	        	return="false";
	        }
            return result;	
}

 private linkedHashMap<Product, Integer> products;

public LinkedHashMap<Product, Int> getHashMapProducts() {
   return products;
}

public void addHashMapProducts(Product p, int quantity) {
   products.put(p, quantity);
}

public String OrderInsertCart(int idProd, int quantity, int sectionClient) {
   Order objO = new Order();
   ProductDAO objProd = new ProductDAO();
   int NewQuant;
   String result;
   List<Order> listOrder  = new ArrayList<Order>();
   int x;
   String ord;
   ord = "order by id ASC";
   int id;
   id = idProd;
   listOrder = SelectObject(ord, context);

   for (x=0;x<listOrder.size();x++){
         objO = listOrder.get(x);
      
   if (objO.SectionUser==sectionUser && objO.Product_idProduct==idProd){
         objO.id = objO.id;
         objO.NewQuant = objO.Quantity+1;
         objO.ValueTotal = objO.ValueUnit*NewQuant;
         result = UpdateObject(objO, context);
   }   else{
      objProd=objProd.SelectSpecificIdObject(objProd, id, context)
         objO.Product_idProduct = objProd.id;
         objO.ValueUnit = objProd.Price;
         objO.Quantity = quant;
         objO.ValueTotal = (quant*objProd.Price);
         objO.SectionUser = sectionUser;
         result = InsertObject(objO, context);
   }

   }

   return result;
}

public Float CalculateTotalValuePurchase(string SessionId) {
   float TotalValue;
   List<Order> ListOrd  = new ArrayList<Order>();
   Order objO = new Order();
   int x;
   String ord;
   ord = "Order by Product_idProduct ASC ";
   ListOrd = SelectObject(ord, context);

   for (x=0;x<listOrder.size();x++){
         objO = ListOrd.get(x);
      
   if (objO.SectionUser==SessionId && objO.StatusFinalized==1){
      TotalValue+=objO.ValueTotal
   }
         return TotalValue;
   }

}


}
