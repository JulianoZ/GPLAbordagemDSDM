
class OrderFinalized {

 private var id: Int = 0


 public func  getId()  -> Int { 
  return self.id
 }

 public func setId(id: Int) {
  self.id = id
 }
 private var valueTotal: Float = 0


 public func  getValueTotal()  -> Float { 
  return self.valueTotal
 }

 public func setValueTotal(valueTotal: Float) {
  self.valueTotal = valueTotal
 }
 private var client_idClients: Int = 0


 public func  getClient_idClients()  -> Int { 
  return self.client_idClients
 }

 public func setClient_idClients(client_idClients: Int) {
  self.client_idClients = client_idClients
 }
 private var dateTime: String = ""


 public func  getDateTime()  -> String { 
  return self.dateTime
 }

 public func setDateTime(dateTime: String) {
  self.dateTime = dateTime
 }
 private var zipCodeDelivery_idZipCodeDelivery: Int = 0


 public func  getZipCodeDelivery_idZipCodeDelivery()  -> Int { 
  return self.zipCodeDelivery_idZipCodeDelivery
 }

 public func setZipCodeDelivery_idZipCodeDelivery(zipCodeDelivery_idZipCodeDelivery: Int) {
  self.zipCodeDelivery_idZipCodeDelivery = zipCodeDelivery_idZipCodeDelivery
 }
 private var valueChange: Float = 0


 public func  getValueChange()  -> Float { 
  return self.valueChange
 }

 public func setValueChange(valueChange: Float) {
  self.valueChange = valueChange
 }
 private var payment_idPayment: Int = 0


 public func  getPayment_idPayment()  -> Int { 
  return self.payment_idPayment
 }

 public func setPayment_idPayment(payment_idPayment: Int) {
  self.payment_idPayment = payment_idPayment
 }
 private var statusOrdered: Int = 0


 public func  getStatusOrdered()  -> Int { 
  return self.statusOrdered
 }

 public func setStatusOrdered(statusOrdered: Int) {
  self.statusOrdered = statusOrdered
 }
 private var statusOrderLocal: Int = 0


 public func  getStatusOrderLocal()  -> Int { 
  return self.statusOrderLocal
 }

 public func setStatusOrderLocal(statusOrderLocal: Int) {
  self.statusOrderLocal = statusOrderLocal
 }
 private var note: String = ""


 public func  getNote()  -> String { 
  return self.note
 }

 public func setNote(note: String) {
  self.note = note
 }
 private var tableNumber: Int = 0


 public func  getTableNumber()  -> Int { 
  return self.tableNumber
 }

 public func setTableNumber(tableNumber: Int) {
  self.tableNumber = tableNumber
 }
 private var checkout: Bool = true


 public func  getCheckout()  -> Bool { 
  return self.checkout
 }

 public func setCheckout(checkout: Bool) {
  self.checkout = checkout
 }
 private var primaryKey: Int = 0


 public func  getPrimaryKey()  -> Int { 
  return self.primaryKey
 }

 public func setPrimaryKey(primaryKey: Int) {
  self.primaryKey = primaryKey
 }
 private var user: User = User()


 public func  getUser()  -> User { 
  return self.user
 }

 public func setUser(user: User) {
  self.user = user
 }

}
