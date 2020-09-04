
class ProductReducedController {


    
    @IBOutlet weak var dataTableView: UITableView!  //reference to tableView from storyBoarding
    private var touchedIndex: Int?                  //reference to row selected 
    
	   var dataListProduct = [Product]()    //reference to list populating the table     	   
 
    
                      

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCustomTableViewCell", for: indexPath) as! ProductCustomTableViewCell
	         cell.name.text = dataListProduct[indexPath.row].name        
	         cell.price.text = dataListProduct[indexPath.row].price        
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
                  controller.name = dataListProduct[touchedIndex!].name
                  controller.price = dataListProduct[touchedIndex!].price
                  controller.img1 = dataListProduct[touchedIndex!].img1
            }
        }
    }    

    

	

func  populateList()  -> Void {
   let objProd =  ProductDAO()	     
   var ord: String	     
   ord = "Order by name "
   dataListProduct = objProd.SelectObject(ord: ord)
}

}
