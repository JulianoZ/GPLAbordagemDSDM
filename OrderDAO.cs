
public class OrderDAO {

public OrderDAO(int id, string j) {
}

public int addValues(int v1, int v2) {
   int total;
   total = v1+v2;
   return total;
}

public String teste(int id, string j) {
   Product objProd = new Product();
   String teste;
   teste = 20;
   List<Order> listOrder  = new List<Order>();
   List<int, float> listNumW  = new List<int, float>();
   List<String> listNumW3  = new List<String>();
   list[] list2 = new list[2];
   listNumW3 = 3;
   listNumW3.Add(teste);
   teste = objProd.getNome();
   int z;
   z = 0;
   String using;

   while (z<listNumW3.Count){
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
 private String name;

 public String getName() {
  return name;
 }

 public void setName(String name) {
  this.name = name;
 }
 private String description;

 public String getDescription() {
  return description;
 }

 public void setDescription(String description) {
  this.description = description;
 }
 private String shortDescription;

 public String getShortDescription() {
  return shortDescription;
 }

 public void setShortDescription(String shortDescription) {
  this.shortDescription = shortDescription;
 }
public string UpdateObject(Order e){
      
	        string result;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            try{
            	string SQL = "UPDATE Order SET id = @id  , Product_idProduct = @Product_idProduct  , product = @product  , ValueUnit = @ValueUnit  , Quantity = @Quantity  , ValueTotal = @ValueTotal  , SectionClient = @SectionClient  , OrderFinalized = @OrderFinalized  , DateTimeOrder = @DateTimeOrder  , StatusFinalized = @StatusFinalized  , OrderFinalized_idOrderFinalized = @OrderFinalized_idOrderFinalized  , ProductDelivered = @ProductDelivered  WHERE id = e.id";
            	MySqlCommand cmd = new MySqlCommand(SQL, Conn);
            	    cmd.Parameters.AddWithValue("@id", e.id);
            	    cmd.Parameters.AddWithValue("@Product_idProduct", e.Product_idProduct);
            	    cmd.Parameters.AddWithValue("@product", e.product);
            	    cmd.Parameters.AddWithValue("@ValueUnit", e.ValueUnit);
            	    cmd.Parameters.AddWithValue("@Quantity", e.Quantity);
            	    cmd.Parameters.AddWithValue("@ValueTotal", e.ValueTotal);
            	    cmd.Parameters.AddWithValue("@SectionClient", e.SectionClient);
            	    cmd.Parameters.AddWithValue("@OrderFinalized", e.OrderFinalized);
            	    cmd.Parameters.AddWithValue("@DateTimeOrder", e.DateTimeOrder);
            	    cmd.Parameters.AddWithValue("@StatusFinalized", e.StatusFinalized);
            	    cmd.Parameters.AddWithValue("@OrderFinalized_idOrderFinalized", e.OrderFinalized_idOrderFinalized);
            	    cmd.Parameters.AddWithValue("@ProductDelivered", e.ProductDelivered);
            	int verify = cmd.ExecuteNonQuery();
            	if (verify != -1){
            	  result = "Data updated into database successfully!";
            	}else{
            	  result = "Error";
            	}
            	command.Dispose();            	          	
            }catch (MySql.Data.MySqlClient.MySqlException ex){
            	result = "Error " + ex.Number + " has occurred: " + ex.Message;
            }
            return result;	
}

public list<Order> SelectObject(String ord){
     
	        List<Order> listObj = new List<Order>(); 
            Order obj = new $E.name();
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand command = Conn.CreateCommand();
            command.CommandText = "select id , Product_idProduct , product , ValueUnit , Quantity , ValueTotal , SectionClient , OrderFinalized , DateTimeOrder , StatusFinalized , OrderFinalized_idOrderFinalized , ProductDelivered from Order " + ord;
            for(Reader.Read()){
            	  obj.setId(Reader.getInt(0));
            	  obj.setProduct_idProduct(Reader.getInt(1));
            	  obj.setProduct(Reader.getProduct(2));
            	  obj.setValueUnit(Reader.getFloat(3));
            	  obj.setQuantity(Reader.getInt(4));
            	  obj.setValueTotal(Reader.getFloat(5));
            	  obj.setSectionClient(Reader.getString(6));
            	  obj.setOrderFinalized(Reader.getString(7));
            	  obj.setDateTimeOrder(Reader.getDateTime(8));
            	  obj.setStatusFinalized(Reader.getBool(9));
            	  obj.setOrderFinalized_idOrderFinalized(Reader.getInt(10));
            	  obj.setProductDelivered(Reader.getBool(11));
                  listObj.add(obj)
            }
            return listObj;	
	
}

public Order SelectSpecificIdObject(Order e, int id, GoogleMap google){
    	        
            Order obj = new Order();
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand command = Conn.CreateCommand();
            command.CommandText = "select id   , Product_idProduct   , product   , ValueUnit   , Quantity   , ValueTotal   , SectionClient   , OrderFinalized   , DateTimeOrder   , StatusFinalized   , OrderFinalized_idOrderFinalized   , ProductDelivered   from Order WHERE id = " & id & "";
            if(Reader.Read()){
                 obj.setId = Reader.getInt(0);
                 obj.setProduct_idProduct = Reader.getInt(1);
                 obj.setProduct = Reader.getProduct(2);
                 obj.setValueUnit = Reader.getFloat(3);
                 obj.setQuantity = Reader.getInt(4);
                 obj.setValueTotal = Reader.getFloat(5);
                 obj.setSectionClient = Reader.getString(6);
                 obj.setOrderFinalized = Reader.getString(7);
                 obj.setDateTimeOrder = Reader.getDateTime(8);
                 obj.setStatusFinalized = Reader.getBool(9);
                 obj.setOrderFinalized_idOrderFinalized = Reader.getInt(10);
                 obj.setProductDelivered = Reader.getBool(11);
            }
            return obj;	
}

public string InsertObject(Order e){
     string result;
	        string SQL;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand();
            try{
            	   cmd.Parameters.AddWithValue("@Product_idProduct", e.Product_idProduct);
            	   cmd.Parameters.AddWithValue("@product", e.product);
            	   cmd.Parameters.AddWithValue("@ValueUnit", e.ValueUnit);
            	   cmd.Parameters.AddWithValue("@Quantity", e.Quantity);
            	   cmd.Parameters.AddWithValue("@ValueTotal", e.ValueTotal);
            	   cmd.Parameters.AddWithValue("@SectionClient", e.SectionClient);
            	   cmd.Parameters.AddWithValue("@OrderFinalized", e.OrderFinalized);
            	   cmd.Parameters.AddWithValue("@DateTimeOrder", e.DateTimeOrder);
            	   cmd.Parameters.AddWithValue("@StatusFinalized", e.StatusFinalized);
            	   cmd.Parameters.AddWithValue("@OrderFinalized_idOrderFinalized", e.OrderFinalized_idOrderFinalized);
            	   cmd.Parameters.AddWithValue("@ProductDelivered", e.ProductDelivered);
            	SQL = "insert into Order (Product_idProduct, product, ValueUnit, Quantity, ValueTotal, SectionClient, OrderFinalized, DateTimeOrder, StatusFinalized, OrderFinalized_idOrderFinalized, ProductDelivered) values (@Product_idProduct, @product, @ValueUnit, @Quantity, @ValueTotal, @SectionClient, @OrderFinalized, @DateTimeOrder, @StatusFinalized, @OrderFinalized_idOrderFinalized, @ProductDelivered)";
            	cmd.Connection = Conn;
                cmd.CommandText = SQL;
                cmd.ExecuteNonQuery();
                result="Data inserted into database successfully!";
                objCon.CloseConnection();   	
            }catch (MySql.Data.MySqlClient.MySqlException ex){
            	result = "Error " + ex.Number + " has occurred: " + ex.Message;
            }
            return result	
}

public string DeleteObject(Order e){
       
            string result;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand command = Conn.CreateCommand();
            command.CommandText = "delete from Order WHERE id = " & e.id & "";
            int verify = cmd.ExecuteNonQuery();
            	if (verify != -1){
            	  result = "Data deleted into database successfully!";
            	}else{
            	  result = "Error";
            	}
            	command.Dispose(); 
            return result;	
}

 private linkedHashMap<Product, int> products;

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
   List<Order> listOrder  = new List<Order>();
   int x;
   String ord;
   ord = "order by id ASC";
   int id;
   id = idProd;
   listOrder = SelectObject(ord);

   for (x=0;x<listOrder.Count;x++){
         objO = listOrder.ElementAt(x);
      
   if (objO.SectionUser==sectionUser && objO.Product_idProduct==idProd){
         objO.id = objO.id;
         objO.NewQuant = objO.Quantity+1;
         objO.ValueTotal = objO.ValueUnit*NewQuant;
         result = UpdateObject(objO);
   }   else{
      objProd=objProd.SelectSpecificIdObject(objProd, id, google)
         objO.Product_idProduct = objProd.id;
         objO.ValueUnit = objProd.Price;
         objO.Quantity = quant;
         objO.ValueTotal = (quant*objProd.Price);
         objO.SectionUser = sectionUser;
         result = InsertObject(objO);
   }

   }

   return result;
}

public float CalculateTotalValuePurchase(string SessionId) {
   float TotalValue;
   List<Order> ListOrd  = new List<Order>();
   Order objO = new Order();
   int x;
   String ord;
   ord = "Order by Product_idProduct ASC ";
   ListOrd = SelectObject(ord);

   for (x=0;x<listOrder.Count;x++){
         objO = ListOrd.ElementAt(x);
      
   if (objO.SectionUser==SessionId && objO.StatusFinalized==1){
      TotalValue+=objO.ValueTotal
   }
         return TotalValue;
   }

}


}
