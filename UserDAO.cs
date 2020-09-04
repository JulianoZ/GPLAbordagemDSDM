
public class UserDAO {

public string UpdateObject(User e){
      
	        string result;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            try{
            	string SQL = "UPDATE User SET id = @id  , name = @name  , email = @email  , password = @password  , phone = @phone  , cellPhone = @cellPhone  , ZipCodeDelivery_idZipCodeDelivery = @ZipCodeDelivery_idZipCodeDelivery  , number = @number  , complement = @complement  , statusUser = @statusUser  , dataTime = @dataTime  WHERE id = e.id";
            	MySqlCommand cmd = new MySqlCommand(SQL, Conn);
            	    cmd.Parameters.AddWithValue("@id", e.id);
            	    cmd.Parameters.AddWithValue("@name", e.name);
            	    cmd.Parameters.AddWithValue("@email", e.email);
            	    cmd.Parameters.AddWithValue("@password", e.password);
            	    cmd.Parameters.AddWithValue("@phone", e.phone);
            	    cmd.Parameters.AddWithValue("@cellPhone", e.cellPhone);
            	    cmd.Parameters.AddWithValue("@ZipCodeDelivery_idZipCodeDelivery", e.ZipCodeDelivery_idZipCodeDelivery);
            	    cmd.Parameters.AddWithValue("@number", e.number);
            	    cmd.Parameters.AddWithValue("@complement", e.complement);
            	    cmd.Parameters.AddWithValue("@statusUser", e.statusUser);
            	    cmd.Parameters.AddWithValue("@dataTime", e.dataTime);
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

public list<User> SelectObject(String ord){
     
	        List<User> listObj = new List<User>(); 
            User obj = new $E.name();
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand command = Conn.CreateCommand();
            command.CommandText = "select id , name , email , password , phone , cellPhone , ZipCodeDelivery_idZipCodeDelivery , number , complement , statusUser , dataTime from User " + ord;
            for(Reader.Read()){
            	  obj.setId(Reader.getInt(0));
            	  obj.setName(Reader.getString(1));
            	  obj.setEmail(Reader.getString(2));
            	  obj.setPassword(Reader.getString(3));
            	  obj.setPhone(Reader.getString(4));
            	  obj.setCellPhone(Reader.getString(5));
            	  obj.setZipCodeDelivery_idZipCodeDelivery(Reader.getInt(6));
            	  obj.setNumber(Reader.getString(7));
            	  obj.setComplement(Reader.getString(8));
            	  obj.setStatusUser(Reader.getBool(9));
            	  obj.setDataTime(Reader.getDateTime(10));
                  listObj.add(obj)
            }
            return listObj;	
	
}

public User SelectSpecificIdObject(User e, int id, GoogleMap google){
    	        
            User obj = new User();
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand command = Conn.CreateCommand();
            command.CommandText = "select id   , name   , email   , password   , phone   , cellPhone   , ZipCodeDelivery_idZipCodeDelivery   , number   , complement   , statusUser   , dataTime   from User WHERE id = " & id & "";
            if(Reader.Read()){
                 obj.setId = Reader.getInt(0);
                 obj.setName = Reader.getString(1);
                 obj.setEmail = Reader.getString(2);
                 obj.setPassword = Reader.getString(3);
                 obj.setPhone = Reader.getString(4);
                 obj.setCellPhone = Reader.getString(5);
                 obj.setZipCodeDelivery_idZipCodeDelivery = Reader.getInt(6);
                 obj.setNumber = Reader.getString(7);
                 obj.setComplement = Reader.getString(8);
                 obj.setStatusUser = Reader.getBool(9);
                 obj.setDataTime = Reader.getDateTime(10);
            }
            return obj;	
}

public string InsertObject(User e){
     string result;
	        string SQL;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand();
            try{
            	   cmd.Parameters.AddWithValue("@name", e.name);
            	   cmd.Parameters.AddWithValue("@email", e.email);
            	   cmd.Parameters.AddWithValue("@password", e.password);
            	   cmd.Parameters.AddWithValue("@phone", e.phone);
            	   cmd.Parameters.AddWithValue("@cellPhone", e.cellPhone);
            	   cmd.Parameters.AddWithValue("@ZipCodeDelivery_idZipCodeDelivery", e.ZipCodeDelivery_idZipCodeDelivery);
            	   cmd.Parameters.AddWithValue("@number", e.number);
            	   cmd.Parameters.AddWithValue("@complement", e.complement);
            	   cmd.Parameters.AddWithValue("@statusUser", e.statusUser);
            	   cmd.Parameters.AddWithValue("@dataTime", e.dataTime);
            	SQL = "insert into User (name, email, password, phone, cellPhone, ZipCodeDelivery_idZipCodeDelivery, number, complement, statusUser, dataTime) values (@name, @email, @password, @phone, @cellPhone, @ZipCodeDelivery_idZipCodeDelivery, @number, @complement, @statusUser, @dataTime)";
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

public string DeleteObject(User e){
       
            string result;
            Connection objCon = new Connection();
            MySqlConnection Conn = new MySqlConnection();
            Conn = objCon.OpenConnection();
            MySqlCommand command = Conn.CreateCommand();
            command.CommandText = "delete from User WHERE id = " & e.id & "";
            int verify = cmd.ExecuteNonQuery();
            	if (verify != -1){
            	  result = "Data deleted into database successfully!";
            	}else{
            	  result = "Error";
            	}
            	command.Dispose(); 
            return result;	
}

public List<String> AuthenticationCli(User cli) {
   User objCl = new User();
   List<String> accessData  = new List<String>();
   List<User> listObjCli  = new List<User>();
   String ord;
   ord = "Order by id";
   listObjCli = SelectObject(ord);
   int x;
   bool status;

   for (x=0;x<listObjCli.Count;x++){
         objCl = listObjCli.ElementAt(x);
      
   if (objCl.email==cli.email && objCl.password==cli.password){
         status = "true";
         accessData.Add(objCli.id);
         accessData.Add(objCli.name);
         accessData.Add(status);
   }   else{
         status = "false";
         objCl.name = "Error";
         accessData.Add(objCl.name);
         accessData.Add(status);
   }

   }

   return accessData;
}


}
