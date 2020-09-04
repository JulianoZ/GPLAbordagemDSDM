
public class OrderAdapter  extends BaseAdapter {


    private LayoutInflater mInflater;
    private List<Order> itens = new ArrayList<Order>();
    private int index= 0;
    private int top = 0;
    Activity act;


    public OrderAdapter(Activity act, List<Order> itens) {
        this.act = act;        
        this.itens = itens;        
        mInflater = LayoutInflater.from(act.getApplicationContext());
    }	
    
    public int getCount(){return itens.size(); }
    public Product getItem(int position){ return itens.get(position); }
    public long getItemId(int position){ return position; }
    
    

public View getView(int position, View view, ViewGroup parent){

	final Order item = itens.get(position);
	view = mInflater.inflate(R.layout.order_item, null);
	
	notifyDataSetChanged();
		
       TextView tv1 = (TextView) view.findViewById(R.id.item_name);
       tv1.setText(item.getName()); 
      	  
       TextView tv2 = (TextView) view.findViewById(R.id.item_price);
       tv2.setText(item.getPrice()); 
      	  
       TextView tv3 = (TextView) view.findViewById(R.id.item_Quantity);
       tv3.setText(item.getQuantity()); 
      	  
	return view 
	
}


}
