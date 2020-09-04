
public class Connection {


    private static final int db_version = 1;
    private Connection(Context context) {
        super(context, "ecommerce", null,db_version );
    }	
    private static Connection sInstance;
    public static synchronized Connection getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new Connection(context.getApplicationContext());
        }
        return sInstance;
    }
    public static int getDataInt(String column, Cursor cursor){ return cursor.getInt(cursor.getColumnIndex(column)); }
    public static String getDataString(String column, Cursor cursor){ return cursor.getString(cursor.getColumnIndex(column)); }
    public static float getDataFloat(String column, Cursor cursor){ return cursor.getFloat(cursor.getColumnIndex(column)); }        
	


}
