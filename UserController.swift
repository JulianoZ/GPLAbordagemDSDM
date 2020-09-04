
class UserController {


    
    @IBOutlet weak var dataTableView: UITableView!  //reference to tableView from storyBoarding
    private var touchedIndex: Int?                  //reference to row selected 
    
	   var dataListUser = [User]()    //reference to list populating the table     	   
 
    
                      

    override func viewDidLoad() {
        super.viewDidLoad()        
         populateList()
        
        
        dataTableView.delegate = self
        dataTableView.dataSource = self   
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCustomTableViewCell", for: indexPath) as! UserCustomTableViewCell
	         cell.name.text = dataListUser[indexPath.row].name        
	         cell.email.text = dataListUser[indexPath.row].email        
        return cell
     }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.touchedIndex = indexPath.row
        
        self.performSegue(withIdentifier: "showAnyViewBySegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "showAnyViewBySegue"){
            let controller: AnyViewController = segue.destination as! AnyViewController
            controller.selectedIndex = touchedIndex
            if touchedIndex != nil{
                  controller.name = dataListUser[touchedIndex!].name
                  controller.email = dataListUser[touchedIndex!].email
                  controller.phone = dataListUser[touchedIndex!].phone
            }
        }
    }    

    

	

func  populateList()  -> Void {
   let objUser =  UserDAO()	     
   var ord: String	     
   ord = "Order by name "
   dataListUser = objUser.SelectObject(ord: ord)
}

}
