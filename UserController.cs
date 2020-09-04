
public class UserController {

    
   public List<User> dataListUser = new List<User>();
	
   public ActionResult User(){   	
   	
 	   populateList();
   	
	   return View(dataListUser);	   
	
  }

public void populateList() {
   UserDAO objUser = new UserDAO();
   String ord;
   ord = "Order by name ";
   dataListUser = objUser.SelectObject(ord);
}


}
