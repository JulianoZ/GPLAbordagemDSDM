
public class OrderFinalizedDAO {

public string UpdateObject(OrderFinalized e, Context context){
 
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "UPDATE OrderFinalized SET id = " + e.getId() + ", valueTotal = " + e.getValueTotal() + ", client_idClients = " + e.getClient_idClients() + ", dateTime = " + e.getDateTime() + ", zipCodeDelivery_idZipCodeDelivery = " + e.getZipCodeDelivery_idZipCodeDelivery() + ", valueChange = " + e.getValueChange() + ", payment_idPayment = " + e.getPayment_idPayment() + ", statusOrdered = " + e.getStatusOrdered() + ", statusOrderLocal = " + e.getStatusOrderLocal() + ", note = " + e.getNote() + ", tableNumber = " + e.getTableNumber() + ", checkout = " + e.getCheckout() + ", primaryKey = " + e.getPrimaryKey() + ", user = " + e.getUser() + " WHERE id = e.id";
	       try{  
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;	
}

public list<OrderFinalized> SelectObject(string ord, Context context){
     List<OrderFinalized> listObj = new ArrayList<OrderFinalized>(); 
            Connection db = Connection.getInstance(context.getApplicationContext());
            String query = "select id, valueTotal, client_idClients, dateTime, zipCodeDelivery_idZipCodeDelivery, valueChange, payment_idPayment, statusOrdered, statusOrderLocal, note, tableNumber, checkout, primaryKey, user from OrderFinalized " + ord";
            Cursor c = db.getWritableDatabase().rawQuery(query,null);
            if(c!=null && c.moveToFirst()){
            	do {
            		OrderFinalized obj = new OrderFinalized();
            		  obj.setId(Connection.getDataInt("id", c));                 
            		  obj.setValueTotal(Connection.getDataFloat("valueTotal", c));                 
            		  obj.setClient_idClients(Connection.getDataInt("client_idClients", c));                 
            		  obj.setDateTime(Connection.getDataDateTime("dateTime", c));                 
            		  obj.setZipCodeDelivery_idZipCodeDelivery(Connection.getDataInt("zipCodeDelivery_idZipCodeDelivery", c));                 
            		  obj.setValueChange(Connection.getDataFloat("valueChange", c));                 
            		  obj.setPayment_idPayment(Connection.getDataInt("payment_idPayment", c));                 
            		  obj.setStatusOrdered(Connection.getDataInt("statusOrdered", c));                 
            		  obj.setStatusOrderLocal(Connection.getDataInt("statusOrderLocal", c));                 
            		  obj.setNote(Connection.getDataString("note", c));                 
            		  obj.setTableNumber(Connection.getDataInt("tableNumber", c));                 
            		  obj.setCheckout(Connection.getDataBool("checkout", c));                 
            		  obj.setPrimaryKey(Connection.getDataInt("primaryKey", c));                 
            		  obj.setUser(Connection.getDataUser("user", c));                 
            		listObj.add(obj);
            	}while (c.moveToNext());
            	c.close();
            db.close();
            }
            return listObj;
}

public Product SelectSpecificIdObject(Product e, int id, Context context){
    		        
	        Connection db = Connection.getInstance(context.getApplicationContext());
	        String query = "SELECT id, name, description, shortDescription, price, peso, stock, Featured, Weight, Picture1, Picture2, SubCategory_idSubCategory, DateTimeRegister, AR, PictureMap, order FROM Product WHERE id=" + id;
	        Cursor c = db.getWritableDatabase().rawQuery(query,null);
	        Product obj = new Product();
	        if(c!=null && c.moveToFirst()){	           
                 obj.setId(Connection.getDataInt("id", c));                 
                 obj.setName(Connection.getDataString("name", c));                 
                 obj.setDescription(Connection.getDataString("description", c));                 
                 obj.setShortDescription(Connection.getDataString("shortDescription", c));                 
                 obj.setPrice(Connection.getDataFloat("price", c));                 
                 obj.setPeso(Connection.getDataFloat("peso", c));                 
                 obj.setStock(Connection.getDataInt("stock", c));                 
                 obj.setFeatured(Connection.getDataBool("Featured", c));                 
                 obj.setWeight(Connection.getDataFloat("Weight", c));                 
                 obj.setPicture1(Connection.getDataString("Picture1", c));                 
                 obj.setPicture2(Connection.getDataString("Picture2", c));                 
                 obj.setSubCategory_idSubCategory(Connection.getDataInt("SubCategory_idSubCategory", c));                 
                 obj.setDateTimeRegister(Connection.getDataDateTime("DateTimeRegister", c));                 
                 obj.setAR(Connection.getDataBool("AR", c));                 
                 obj.setPictureMap(Connection.getDataString("PictureMap", c));                 
                 obj.setOrder(Connection.getDataOrder("order", c));                 
               c.close();
               db.close();
            }else{
               obj = null; 
            }
        return obj;	

}

public string InsertObject(OrderFinalized e, Context context){
      
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "insert into OrderFinalized (id, valueTotal, client_idClients, dateTime, zipCodeDelivery_idZipCodeDelivery, valueChange, payment_idPayment, statusOrdered, statusOrderLocal, note, tableNumber, checkout, primaryKey, user) values ('" + e.getId()  + "','" + e.getValueTotal()  + "','" + e.getClient_idClients()  + "','" + e.getDateTime()  + "','" + e.getZipCodeDelivery_idZipCodeDelivery()  + "','" + e.getValueChange()  + "','" + e.getPayment_idPayment()  + "','" + e.getStatusOrdered()  + "','" + e.getStatusOrderLocal()  + "','" + e.getNote()  + "','" + e.getTableNumber()  + "','" + e.getCheckout()  + "','" + e.getPrimaryKey()  + "','" + e.getUser()  + "')";
	       try{
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;
}

public string DeleteObject(OrderFinalized e, Context context){
     
	        string result;  
	        Connection db = Connection.getInstance(c.getApplicationContext()); 
	        String query = "DELETE FROM OrderFinalized WHERE id=" + e.getId();  
	        try{
	        	db.getWritableDatabase().execSQL(query); 
	        	db.close(); 
	        	return="true";
	        }catch(Exception e){ 
	        	return="false";
	        }
            return result;	
}

public string InsertObject2(OrderFinalized e){
      
	        string result;
	        string SQL;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand();
            try{
            	   cmd.Parameters.AddWithValue("@valueTotal", valueTotal);
            	   cmd.Parameters.AddWithValue("@client_idClients", client_idClients);
            	   cmd.Parameters.AddWithValue("@dateTime", dateTime);
            	   cmd.Parameters.AddWithValue("@zipCodeDelivery_idZipCodeDelivery", zipCodeDelivery_idZipCodeDelivery);
            	   cmd.Parameters.AddWithValue("@valueChange", valueChange);
            	   cmd.Parameters.AddWithValue("@payment_idPayment", payment_idPayment);
            	   cmd.Parameters.AddWithValue("@statusOrdered", statusOrdered);
            	   cmd.Parameters.AddWithValue("@statusOrderLocal", statusOrderLocal);
            	   cmd.Parameters.AddWithValue("@note", note);
            	   cmd.Parameters.AddWithValue("@tableNumber", tableNumber);
            	   cmd.Parameters.AddWithValue("@checkout", checkout);
            	   cmd.Parameters.AddWithValue("@primaryKey", primaryKey);
            	   cmd.Parameters.AddWithValue("@user", user);
            	SQL = "insert into OrderFinalized (valueTotal , client_idClients , dateTime , zipCodeDelivery_idZipCodeDelivery , valueChange , payment_idPayment , statusOrdered , statusOrderLocal , note , tableNumber , checkout , primaryKey , user) values (@valueTotal , @client_idClients , @dateTime , @zipCodeDelivery_idZipCodeDelivery , @valueChange , @payment_idPayment , @statusOrdered , @statusOrderLocal , @note , @tableNumber , @checkout , @primaryKey , @user)";
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


}
