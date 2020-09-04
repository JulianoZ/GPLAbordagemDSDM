
public class GPSPosition {

 private list<String> dataRealLocationList;


    public static final int MY_PERMISSIONS_REQUEST_LOCATION = 99;
    private FusedLocationProviderClient mFusedLocationClient;
    
    List<String> dataRealLocationList;
	
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_gpspositiongetdatalocation);
        
        LocationManager service = (LocationManager) getSystemService(LOCATION_SERVICE);
        boolean enabled = service.isProviderEnabled(LocationManager.GPS_PROVIDER);   
        if (!enabled) {
            showSettingAlert();
        }
       if(checkLocationPermission()) {
            mFusedLocationClient = LocationServices.getFusedLocationProviderClient(GPSV2Activity.this);
            mFusedLocationClient.getLastLocation()
                    .addOnSuccessListener(${className}.this, new OnSuccessListener<Location>() {
                        @Override
                        public void onSuccess(Location location) {
                            // Got last known location. In some rare situations this can be null.

                            if (location != null) {
                            	
                            List<String> dataLocationList = new ArrayList<String>();
                            dataLocationList.add("latitude");
                            dataLocationList.add("longitude");
                            
                            dataRealLocationList = getDataLocation(location, dataLocationList);                    	
           
                            }else{Log.d("LOCATION", "NULL");}
                        }
                    });
        } 
        useData();                    
        
     }
     
     
     
   public boolean checkLocationPermission() {
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.ACCESS_FINE_LOCATION)
                != PackageManager.PERMISSION_GRANTED) {
            // Should we show an explanation?
            if (ActivityCompat.shouldShowRequestPermissionRationale(this, Manifest.permission.ACCESS_FINE_LOCATION)) {
                new AlertDialog.Builder(this)
                        .setTitle("Permission GPS")
                        .setMessage("Please, active your GPS.")
                        .setPositiveButton("Confirm", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialogInterface, int i) {
                                //Prompt the user once explanation has been shown
                                ActivityCompat.requestPermissions(GPSV2Activity.this,
                                        new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                                        MY_PERMISSIONS_REQUEST_LOCATION);
                            }
                        })
                        .create()
                        .show();
            } else {
                // No explanation needed, we can request the permission.
                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.ACCESS_FINE_LOCATION},
                        MY_PERMISSIONS_REQUEST_LOCATION);
            }
            return false;
        } else {
            return true;
        }
    }


    public void showSettingAlert()
    {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(GPSV2Activity.this);
        alertDialog.setTitle("GPS setting!");
        alertDialog.setMessage("GPS isn't active, would like to enable?");
        alertDialog.setPositiveButton("Confirm", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                ${className}.this.startActivity(intent);
            }
        });
        alertDialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });
        alertDialog.show();
    }     
        
        
        
        	
	
	

public list<string> getLocation(Location locValue, List<string> data){

     List<String> dataLocationList = new ArrayList<String>();
        String getData;
        for(int x=0;x<data.size();x++) {
          getData = "";
          if (locValue != null) {
          if (data.get(x) == "latitude") {               
            getData = String.valueOf(location.getLatitude());               
          }
          if (data.get(x) == "longitude") {               
            getData = String.valueOf(location.getLongitude());               
          }
          dataLocationList.add(getData);          
          } else {
            Log.d("LOCATION", "NULL");
          }
        }
        return dataLocationList;	
}

public void useData() {
   int x;
   String data;

   for (x=0;x<dataRealLocationList.size();x++){
         data = dataRealLocationList.get(x);
   }

}


}
