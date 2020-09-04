
public class ProductDAO {

public string UpdateObject(Product e, Context context){
 
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "UPDATE Product SET id = " + e.getId() + ", name = " + e.getName() + ", description = " + e.getDescription() + ", shortDescription = " + e.getShortDescription() + ", price = " + e.getPrice() + ", peso = " + e.getPeso() + ", stock = " + e.getStock() + ", Featured = " + e.getFeatured() + ", Weight = " + e.getWeight() + ", Picture1 = " + e.getPicture1() + ", Picture2 = " + e.getPicture2() + ", SubCategory_idSubCategory = " + e.getSubCategory_idSubCategory() + ", DateTimeRegister = " + e.getDateTimeRegister() + ", AR = " + e.getAR() + ", PictureMap = " + e.getPictureMap() + ", order = " + e.getOrder() + " WHERE id = e.id";
	       try{  
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;	
}

public list<Product> SelectObject(string ord, Context context){
     List<Product> listObj = new ArrayList<Product>(); 
            Connection db = Connection.getInstance(context.getApplicationContext());
            String query = "select id, name, description, shortDescription, price, peso, stock, Featured, Weight, Picture1, Picture2, SubCategory_idSubCategory, DateTimeRegister, AR, PictureMap, order from Product " + ord";
            Cursor c = db.getWritableDatabase().rawQuery(query,null);
            if(c!=null && c.moveToFirst()){
            	do {
            		Product obj = new Product();
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

public string InsertObject(Product e, Context context){
      
	       String result;
	       Connection db = Connection.getInstance(c.getApplicationContext());
	       String query = "insert into Product (id, name, description, shortDescription, price, peso, stock, Featured, Weight, Picture1, Picture2, SubCategory_idSubCategory, DateTimeRegister, AR, PictureMap, order) values ('" + e.getId()  + "','" + e.getName()  + "','" + e.getDescription()  + "','" + e.getShortDescription()  + "','" + e.getPrice()  + "','" + e.getPeso()  + "','" + e.getStock()  + "','" + e.getFeatured()  + "','" + e.getWeight()  + "','" + e.getPicture1()  + "','" + e.getPicture2()  + "','" + e.getSubCategory_idSubCategory()  + "','" + e.getDateTimeRegister()  + "','" + e.getAR()  + "','" + e.getPictureMap()  + "','" + e.getOrder()  + "')";
	       try{
	       	db.getWritableDatabase().execSQL(query); db.close(); 
	       	return="Data updated into database successfully!";
	       }catch(Exception e){
	       	return "Error " + e.getMessage();
	       }
	       return result;
}

public string DeleteObject(Product e, Context context){
     
	        string result;  
	        Connection db = Connection.getInstance(c.getApplicationContext()); 
	        String query = "DELETE FROM Product WHERE id=" + e.getId();  
	        try{
	        	db.getWritableDatabase().execSQL(query); 
	        	db.close(); 
	        	return="true";
	        }catch(Exception e){ 
	        	return="false";
	        }
            return result;	
}

public List<Product> ProductListSpecificSubCat(int idSubCat) {
   Product objProd = new Product();
   List<Product> listObjProd  = new ArrayList<Product>();
   List<Product> listObjProdSpec  = new ArrayList<Product>();
   String ord;
   ord = "Order by name";
   listObjProd = SelectObject(ord, context);
   int x;

   for (x=0;x<listObjprod.size();x++){
         objProd = listObjProd.get(x);
      
   if (objProd.SubCategory_idSubCategory==idSubCat){
         listObjprodSpec.add(objProd);
   }
   }

   return listObjProdSpec;
}


}
