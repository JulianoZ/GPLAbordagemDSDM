
public class MainActivityWatch  extends WearableActivity {

  
	 public List<Product> dataListProduct = new ArrayList<Product>();
	   
	 
	  
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product);    
        
        

         onDataChanged();

     
         //Instantiate the adapter in case get variable from another screen       
        ListView listView;
        listView = findViewById(R.id.list_view);         
        ProductWatchAdapter adapter = new ProductWatchAdapter(ProductSmartController.this, dataListProduct);        
        listView.setAdapter(adapter);
     
     
     
    }

public void onDataChanged(DataEventBuffer dataEvents){

        for (DataEvent event : dataEvents) { //get data by bloutooth
            if (event.getType() == DataEvent.TYPE_CHANGED) {
                DataItem item = event.getDataItem();
                if (item.getUri().getPath().compareTo("/count") == 0) {
                    DataMap dataMap = DataMapItem.fromDataItem(item).getDataMap();
                    Product val = dataMap.getString(COUNT_KEY);
                    if(val != null){                        
                        dataListProduct.clear();
                        dataListProduct.addAll(product);
                        dataListProduct.deferNotifyDataSetChanged();
                        adapter.notifyDataSetChanged();
                    }
                }
            } else if (event.getType() == DataEvent.TYPE_DELETED) {
                // DataItem deleted
            }
        }	
}


}
