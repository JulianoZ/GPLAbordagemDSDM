

class ControllerUserFragment {



func onViewCreated(textField: UITextField)  -> User{
   let objCli =  UserDAO()	     
   listUser = [User]()
   var ord: String	     
   ord = "Order by name"
   listUser = objCli.SelectObject(ord: ord)

	    resultsTableView!.reloadData()
}



}
