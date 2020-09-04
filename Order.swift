
class Order  extends Product {

 private var id: Int = 0


 public func  getId()  -> Int { 
  return self.id
 }

 public func setId(id: Int) {
  self.id = id
 }
 private var Product_idProduct: Int = 0


 public func  getProduct_idProduct()  -> Int { 
  return self.Product_idProduct
 }

 public func setProduct_idProduct(Product_idProduct: Int) {
  self.Product_idProduct = Product_idProduct
 }
 private var product: Product = Product()


 public func  getProduct()  -> Product { 
  return self.product
 }

 public func setProduct(product: Product) {
  self.product = product
 }
 private var ValueUnit: Float = 0


 public func  getValueUnit()  -> Float { 
  return self.ValueUnit
 }

 public func setValueUnit(ValueUnit: Float) {
  self.ValueUnit = ValueUnit
 }
 private var Quantity: Int = 0


 public func  getQuantity()  -> Int { 
  return self.Quantity
 }

 public func setQuantity(Quantity: Int) {
  self.Quantity = Quantity
 }
 private var ValueTotal: Float = 0


 public func  getValueTotal()  -> Float { 
  return self.ValueTotal
 }

 public func setValueTotal(ValueTotal: Float) {
  self.ValueTotal = ValueTotal
 }
 private var SectionClient: String = ""


 public func  getSectionClient()  -> String { 
  return self.SectionClient
 }

 public func setSectionClient(SectionClient: String) {
  self.SectionClient = SectionClient
 }
 private var OrderFinalized: String = ""


 public func  getOrderFinalized()  -> String { 
  return self.OrderFinalized
 }

 public func setOrderFinalized(OrderFinalized: String) {
  self.OrderFinalized = OrderFinalized
 }
 private var DateTimeOrder: String = ""


 public func  getDateTimeOrder()  -> String { 
  return self.DateTimeOrder
 }

 public func setDateTimeOrder(DateTimeOrder: String) {
  self.DateTimeOrder = DateTimeOrder
 }
 private var StatusFinalized: Bool = true


 public func  getStatusFinalized()  -> Bool { 
  return self.StatusFinalized
 }

 public func setStatusFinalized(StatusFinalized: Bool) {
  self.StatusFinalized = StatusFinalized
 }
 private var OrderFinalized_idOrderFinalized: Int = 0


 public func  getOrderFinalized_idOrderFinalized()  -> Int { 
  return self.OrderFinalized_idOrderFinalized
 }

 public func setOrderFinalized_idOrderFinalized(OrderFinalized_idOrderFinalized: Int) {
  self.OrderFinalized_idOrderFinalized = OrderFinalized_idOrderFinalized
 }
 private var ProductDelivered: Bool = true


 public func  getProductDelivered()  -> Bool { 
  return self.ProductDelivered
 }

 public func setProductDelivered(ProductDelivered: Bool) {
  self.ProductDelivered = ProductDelivered
 }

}
