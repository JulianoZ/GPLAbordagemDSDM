
public class ProductWatchAdapter  extends BaseAdapter {


    private LayoutInflater mInflater;
    private List<Product> itens = new ArrayList<Product>();
    private int index= 0;
    private int top = 0;
    Activity act;


    public ProductAdapter(Activity act, List<Product> itens) {
        this.act = act;        
        this.itens = itens;        
        mInflater = LayoutInflater.from(act.getApplicationContext());
    }	
    
    public int getCount(){return itens.size(); }
    public Product getItem(int position){ return itens.get(position); }
    public long getItemId(int position){ return position; }
    
    

public View getView(int position, View view, ViewGroup parent){

	final Product item = itens.get(position);
	view = mInflater.inflate(R.layout.product_item, null);
	
	notifyDataSetChanged();
		
       TextView tv1 = (TextView) view.findViewById(R.id.item_name);
       tv1.setText(item.getName()); 
      	  
       TextView tv2 = (TextView) view.findViewById(R.id.item_price);
       tv2.setText(item.getPrice()); 
      	  
	return view 
	
}


}
