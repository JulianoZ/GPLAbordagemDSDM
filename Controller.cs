
public class Controller {

public ActionResult Product(){
   ProductDAO objProd = new ProductDAO();
   CategoryDAO objCat = new CategoryDAO();
   SubCategoryDAO objSubCat = new SubCategoryDAO();
   List<Product> listProduct  = new List<Product>();
   List<Category> listCategory  = new List<Category>();
   List<SubCategory> listSubCategory  = new List<SubCategory>();
   String ord;
   ord = "Order by name";
   listProduct = objProd.SelectObject(ord);
   listCategory = objCat.SelectObject(ord);
   listSubCategory = objSubCat.SelectObject(ord);

return View(Tuple.Create(listProduct, listCategory, listSubCategory);
}

public User User(){
   UserDAO objCli = new UserDAO();
   List<User> listUser  = new List<User>();
   String ord;
   ord = "Order by name";
   listUser = objCli.SelectObject(ord);

return View(Tuple.Create(listClient);
}

public  Order(int id){
   OrderDAO objOrder = new OrderDAO();
   List<Order> listOrder  = new List<Order>();
   String ord;
   ord = "Order by name";
   listOrder = objOrder.SelectSpecificIdObject(Order, id, google);

return View(Tuple.Create(listOrder);
}


}
