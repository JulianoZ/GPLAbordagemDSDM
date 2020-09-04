
public class UserController {

  
	 public List<User> dataListUser = new ArrayList<User>();
	   
	 
	  
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user);    
        
        

         populateList();

     
         //Instantiate the adapter in case get variable from another screen       
        ListView listView;
        listView = findViewById(R.id.list_view);         
        UserAdapter adapter = new UserAdapter(UserController.this, dataListUser);        
        listView.setAdapter(adapter);
     
     
     
     
     
    }

public void populateList() {
   UserDAO objUser = new UserDAO();
   String ord;
   ord = "Order by name ";
   dataListUser = objUser.SelectObject(ord);
}


}
