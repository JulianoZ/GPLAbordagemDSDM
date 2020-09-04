
public class OrderFinalizedAdapter  extends BaseAdapter {


    private LayoutInflater mInflater;
    private List<OrderFinalized> itens = new ArrayList<OrderFinalized>();
    private int index= 0;
    private int top = 0;
    Activity act;


    public OrderFinalizedAdapter(Activity act, List<OrderFinalized> itens) {
        this.act = act;        
        this.itens = itens;        
        mInflater = LayoutInflater.from(act.getApplicationContext());
    }	
    
    public int getCount(){return itens.size(); }
    public Product getItem(int position){ return itens.get(position); }
    public long getItemId(int position){ return position; }
    
    

public View getView(int position, View view, ViewGroup parent){

	final OrderFinalized item = itens.get(position);
	view = mInflater.inflate(R.layout.orderFinalized_item, null);
	
	notifyDataSetChanged();
		
       TextView tv1 = (TextView) view.findViewById(R.id.item_name);
       tv1.setText(item.getName()); 
      	  
       TextView tv2 = (TextView) view.findViewById(R.id.item_valueTotal);
       tv2.setText(item.getValueTotal()); 
      	  
       TextView tv3 = (TextView) view.findViewById(R.id.item_date);
       tv3.setText(item.getDate()); 
      	  
	return view 
	
}


}
