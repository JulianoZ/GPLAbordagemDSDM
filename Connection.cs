
public class Connection {


       private MySqlConnection Conn;
       public MySqlConnection OpenConnection(){       	
         Conn = new MySqlConnection("server=MYSQL5011.Smarterasp.net;database=ecommerce;uid=db_rest_user;pwd=restCommerce2019");         
         Conn.Open();
         return Conn;   
       }
        public void CloseConnection(){
            Conn.Close();
       }    	


}
