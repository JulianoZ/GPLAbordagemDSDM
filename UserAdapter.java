
public class UserAdapter  extends ArrayAdapter {


    private LayoutInflater mInflater;
    private List<User> itens = new ArrayList<User>();
    private int index= 0;
    private int top = 0;
    Activity act;


    public UserAdapter(Activity act, List<User> itens) {
        this.act = act;        
        this.itens = itens;        
        mInflater = LayoutInflater.from(act.getApplicationContext());
    }	
    
    public int getCount(){return itens.size(); }
    public Product getItem(int position){ return itens.get(position); }
    public long getItemId(int position){ return position; }
    
    

public View getView(int position, View view, ViewGroup parent){

	final User item = itens.get(position);
	view = mInflater.inflate(R.layout.user_item, null);
	
	notifyDataSetChanged();
		
       TextView tv1 = (TextView) view.findViewById(R.id.item_name);
       tv1.setText(item.getName()); 
      	  
       TextView tv2 = (TextView) view.findViewById(R.id.item_email);
       tv2.setText(item.getEmail()); 
      	  
	   ImageView img3 = (ImageView) view.findViewById(R.id.item_phone);
       img3.setImageBitmap(item.getPhone());
      	  
	return view 
	
}


}
