

class ControllerProductFragment {


func onViewCreated(textField: UITextField)  -> ActionResult{
   let objProd =  ProductDAO()	     
   let objCat =  CategoryDAO()	     
   let objSubCat =  SubCategoryDAO()	     
   listProduct = [Product]()
   listCategory = [Category]()
   listSubCategory = [SubCategory]()
   var ord: String	     
   ord = "Order by name"
   listProduct = objProd.SelectObject(ord: ord)
   listCategory = objCat.SelectObject(ord: ord)
   listSubCategory = objSubCat.SelectObject(ord: ord)

	    resultsTableView!.reloadData()
}




}
