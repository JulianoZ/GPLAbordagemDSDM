
public class UserDAO {

public string UpdateObject(User e, Context context){
 
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "UPDATE User SET id = " + e.getId() + ", name = " + e.getName() + ", email = " + e.getEmail() + ", password = " + e.getPassword() + ", phone = " + e.getPhone() + ", cellPhone = " + e.getCellPhone() + ", ZipCodeDelivery_idZipCodeDelivery = " + e.getZipCodeDelivery_idZipCodeDelivery() + ", number = " + e.getNumber() + ", complement = " + e.getComplement() + ", statusUser = " + e.getStatusUser() + ", dataTime = " + e.getDataTime() + " WHERE id = e.id";
	       try{  
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;	
}

public list<User> SelectObject(string ord, Context context){
     List<User> listObj = new ArrayList<User>(); 
            Connection db = Connection.getInstance(context.getApplicationContext());
            String query = "select id, name, email, password, phone, cellPhone, ZipCodeDelivery_idZipCodeDelivery, number, complement, statusUser, dataTime from User " + ord";
            Cursor c = db.getWritableDatabase().rawQuery(query,null);
            if(c!=null && c.moveToFirst()){
            	do {
            		User obj = new User();
            		  obj.setId(Connection.getDataInt("id", c));                 
            		  obj.setName(Connection.getDataString("name", c));                 
            		  obj.setEmail(Connection.getDataString("email", c));                 
            		  obj.setPassword(Connection.getDataString("password", c));                 
            		  obj.setPhone(Connection.getDataString("phone", c));                 
            		  obj.setCellPhone(Connection.getDataString("cellPhone", c));                 
            		  obj.setZipCodeDelivery_idZipCodeDelivery(Connection.getDataInt("ZipCodeDelivery_idZipCodeDelivery", c));                 
            		  obj.setNumber(Connection.getDataString("number", c));                 
            		  obj.setComplement(Connection.getDataString("complement", c));                 
            		  obj.setStatusUser(Connection.getDataBool("statusUser", c));                 
            		  obj.setDataTime(Connection.getDataDateTime("dataTime", c));                 
            		listObj.add(obj);
            	}while (c.moveToNext());
            	c.close();
            db.close();
            }
            return listObj;
}

public User SelectSpecificIdObject(User e, int id, Context context){
    		        
	        Connection db = Connection.getInstance(context.getApplicationContext());
	        String query = "SELECT id, name, email, password, phone, cellPhone, ZipCodeDelivery_idZipCodeDelivery, number, complement, statusUser, dataTime FROM User WHERE id=" + id;
	        Cursor c = db.getWritableDatabase().rawQuery(query,null);
	        User obj = new User();
	        if(c!=null && c.moveToFirst()){	           
                 obj.setId(Connection.getDataInt("id", c));                 
                 obj.setName(Connection.getDataString("name", c));                 
                 obj.setEmail(Connection.getDataString("email", c));                 
                 obj.setPassword(Connection.getDataString("password", c));                 
                 obj.setPhone(Connection.getDataString("phone", c));                 
                 obj.setCellPhone(Connection.getDataString("cellPhone", c));                 
                 obj.setZipCodeDelivery_idZipCodeDelivery(Connection.getDataInt("ZipCodeDelivery_idZipCodeDelivery", c));                 
                 obj.setNumber(Connection.getDataString("number", c));                 
                 obj.setComplement(Connection.getDataString("complement", c));                 
                 obj.setStatusUser(Connection.getDataBool("statusUser", c));                 
                 obj.setDataTime(Connection.getDataDateTime("dataTime", c));                 
               c.close();
               db.close();
            }else{
               obj = null; 
            }
        return obj;	

}

public string InsertObject(User e, Context context){
      
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "insert into User (id, name, email, password, phone, cellPhone, ZipCodeDelivery_idZipCodeDelivery, number, complement, statusUser, dataTime) values ('" + e.getId()  + "','" + e.getName()  + "','" + e.getEmail()  + "','" + e.getPassword()  + "','" + e.getPhone()  + "','" + e.getCellPhone()  + "','" + e.getZipCodeDelivery_idZipCodeDelivery()  + "','" + e.getNumber()  + "','" + e.getComplement()  + "','" + e.getStatusUser()  + "','" + e.getDataTime()  + "')";
	       try{
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;
}

public string DeleteObject(User e, Context context){
     
	        string result;  
	        Connection db = Connection.getInstance(c.getApplicationContext()); 
	        String query = "DELETE FROM User WHERE id=" + e.getId();  
	        try{
	        	db.getWritableDatabase().execSQL(query); 
	        	db.close(); 
	        	return="true";
	        }catch(Exception e){ 
	        	return="false";
	        }
            return result;	
}

public List<String> AuthenticationCli(User cli) {
   User objCl = new User();
   List<String> accessData  = new ArrayList<String>();
   List<User> listObjCli  = new ArrayList<User>();
   String ord;
   ord = "Order by id";
   listObjCli = SelectObject(ord, context);
   int x;
   bool status;

   for (x=0;x<listObjCli.size();x++){
         objCl = listObjCli.get(x);
      
   if (objCl.email==cli.email && objCl.password==cli.password){
         status = "true";
         accessData.add(objCli.id);
         accessData.add(objCli.name);
         accessData.add(status);
   }   else{
         status = "false";
         objCl.name = "Error";
         accessData.add(objCl.name);
         accessData.add(status);
   }

   }

   return accessData;
}


}
