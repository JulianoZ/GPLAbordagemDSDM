
class OrderFinalizedAdm {


    
    @IBOutlet weak var dataTableView: UITableView!  //reference to tableView from storyBoarding
    private var touchedIndex: Int?                  //reference to row selected 
    
	   var dataListOrderFinalized = [OrderFinalized]()    //reference to list populating the table     	   
 
         //Declaration of variable in case to get variable from another screen 
     	var idOrderedFinalized: Int?
     	var statusOrdered: Int?
    
                      

    override func viewDidLoad() {
        super.viewDidLoad()        
         populateList(idOrderedFinalized: idOrderedFinalized, statusOrdered: statusOrdered)
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderFinalizedCustomTableViewCell", for: indexPath) as! OrderFinalizedCustomTableViewCell
	         cell.name.text = dataListOrderFinalized[indexPath.row].name        
	         cell.valueTotal.text = dataListOrderFinalized[indexPath.row].valueTotal        
	         cell.date.text = dataListOrderFinalized[indexPath.row].date        
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
                  controller.name = dataListOrderFinalized[touchedIndex!].name
                  controller.valueTotal = dataListOrderFinalized[touchedIndex!].valueTotal
                  controller.date = dataListOrderFinalized[touchedIndex!].date
            }
        }
    }    

    

	

func  populateList(idOrderedFinalized: Int, statusOrdered: Int)  -> Void {
   let objOrderFinalizedDAO =  OrderFinalizedDAO()	     
   listOrderFinalized = [OrderFinalized]()
   var ord: String	     
   ord = "Order by id desc"
   listOrderFinalized = objOrderFinalizedDAO.SelectObject(ord: ord)
   adjustStatusOrder(idOrderedFinalized: idOrderedFinalized, statusOrdered: statusOrdered, listOrderFinalized: listOrderFinalized)
   dataListOrderFinalized = insertDataListOrder(listOrderFinalized: listOrderFinalized)
}
func  insertDataListOrder(listOrderFinalized: [OrderFinalized])  -> [Order] {
   var x: Int	     
   listOrderFin = [OrderFinalized]()
   let objUserDao =  UserDAO()	     
   let objUser =  User()	     
   let objOrderFinalized =  OrderFinalized()	     
   x=0
   while x<listOrderFinalized.size {
      objOrderFinalized = listOrderFinalized.get(x)
      objUser = objUserDao.SelectSpecificIdObject(objUser: objUser, objOrderFinalized: objOrderFinalized)
      objOrderFinalized.setUser(objUser: objUser)	  
      listOrderFin.append(objOrderFinalized: objOrderFinalized)	  
   x+=1
   }

   return listOrderFin
}
func  adjustStatusOrder(idOrderedFinalized: Int, statusOrdered: Int, listOrderFinalized: [OrderFinalized])  -> Void {
   var result: String	     

   if ((idOrderedFinalized!=0)){
         var x: Int	     
         let objOF =  OrderFinalized()	     
         let objFDao =  OrderFinalizedDAO()	     
         x=0
   while x<listOrderFinalized.size {
      objOF = listOrderFinalized.get(x)
   
   if (objOF.idOrderedFinalized==idOrderedFinalized){
         var statusOr: Int	     
         statusOr = adjustStatus(statusOrdered: statusOrdered)
         objOF.setStatusOrdered(statusOr: statusOr)	  
         result = objFDao.UpdateObject(objOF: objOF)
   }
   x+=1
   }

   }
}
func  adjustStatus(CurrentStatusOrder: Int)  -> Int {
   var status: Int	     
   status = 0

   if (CurrentStatusOrder==0){
         status = 1
   }
   else if(CurrentStatusOrder==1){
         status = 2
   }
   else if(CurrentStatusOrder==2){
         status = 3
   }
   else if(CurrentStatusOrder==3){
         status = 4
   }

   return status
}

}
