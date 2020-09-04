
class User {

 private var id: Int = 0


 public func  getId()  -> Int { 
  return self.id
 }

 public func setId(id: Int) {
  self.id = id
 }
 private var name: String = ""


 public func  getName()  -> String { 
  return self.name
 }

 public func setName(name: String) {
  self.name = name
 }
 private var email: String = ""


 public func  getEmail()  -> String { 
  return self.email
 }

 public func setEmail(email: String) {
  self.email = email
 }
 private var password: String = ""


 public func  getPassword()  -> String { 
  return self.password
 }

 public func setPassword(password: String) {
  self.password = password
 }
 private var phone: String = ""


 public func  getPhone()  -> String { 
  return self.phone
 }

 public func setPhone(phone: String) {
  self.phone = phone
 }
 private var cellPhone: String = ""


 public func  getCellPhone()  -> String { 
  return self.cellPhone
 }

 public func setCellPhone(cellPhone: String) {
  self.cellPhone = cellPhone
 }
 private var ZipCodeDelivery_idZipCodeDelivery: Int = 0


 public func  getZipCodeDelivery_idZipCodeDelivery()  -> Int { 
  return self.ZipCodeDelivery_idZipCodeDelivery
 }

 public func setZipCodeDelivery_idZipCodeDelivery(ZipCodeDelivery_idZipCodeDelivery: Int) {
  self.ZipCodeDelivery_idZipCodeDelivery = ZipCodeDelivery_idZipCodeDelivery
 }
 private var number: String = ""


 public func  getNumber()  -> String { 
  return self.number
 }

 public func setNumber(number: String) {
  self.number = number
 }
 private var complement: String = ""


 public func  getComplement()  -> String { 
  return self.complement
 }

 public func setComplement(complement: String) {
  self.complement = complement
 }
 private var statusUser: Bool = true


 public func  getStatusUser()  -> Bool { 
  return self.statusUser
 }

 public func setStatusUser(statusUser: Bool) {
  self.statusUser = statusUser
 }
 private var dataTime: String = ""


 public func  getDataTime()  -> String { 
  return self.dataTime
 }

 public func setDataTime(dataTime: String) {
  self.dataTime = dataTime
 }

}
