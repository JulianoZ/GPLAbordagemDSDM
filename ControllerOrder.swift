

class ControllerOrderFragment {




func onViewCreated(id: inttextField: UITextField) {
   let objOrder =  OrderDAO()	     
   listOrder = [Order]()
   var ord: String	     
   ord = "Order by name"
   listOrder = objOrder.SelectSpecificIdObject(Order: Order, id: id)

	    resultsTableView!.reloadData()
}


}
