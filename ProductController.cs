
public class ProductController {

    
   public List<Product> dataListProduct = new List<Product>();
   public List<Category> dataListCategory = new List<Category>();
   public List<SubCategory> dataListSubCategory = new List<SubCategory>();
	
   public ActionResult Product(){   	
   	
 	   populateList();
   	
	
	   return View(Tuple.Create(dataListProduct, dataListCategory, dataListSubCategory));
  }

public void populateList() {
   ProductDAO objProd = new ProductDAO();
   CategoryDAO objCat = new CategoryDAO();
   SubCategoryDAO objSubCat = new SubCategoryDAO();
   String ord;
   ord = "Order by name ";
   dataListProduct = objProd.SelectObject(ord);
   dataListCategory = objCat.SelectObject(ord);
   dataListSubCategory = objSubCat.SelectObject(ord);
}


}
