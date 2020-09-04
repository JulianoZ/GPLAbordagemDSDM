
public class Order  extends Product {

 private int id;

 public int getId() {
  return id;
 }

 public void setId(int id) {
  this.id = id;
 }
 private int Product_idProduct;

 public int getProduct_idProduct() {
  return Product_idProduct;
 }

 public void setProduct_idProduct(int Product_idProduct) {
  this.Product_idProduct = Product_idProduct;
 }
 private Product product;

 public Product getProduct() {
  return product;
 }

 public void setProduct(Product product) {
  this.product = product;
 }
 private float ValueUnit;

 public float getValueUnit() {
  return ValueUnit;
 }

 public void setValueUnit(float ValueUnit) {
  this.ValueUnit = ValueUnit;
 }
 private int Quantity;

 public int getQuantity() {
  return Quantity;
 }

 public void setQuantity(int Quantity) {
  this.Quantity = Quantity;
 }
 private float ValueTotal;

 public float getValueTotal() {
  return ValueTotal;
 }

 public void setValueTotal(float ValueTotal) {
  this.ValueTotal = ValueTotal;
 }
 private String SectionClient;

 public String getSectionClient() {
  return SectionClient;
 }

 public void setSectionClient(String SectionClient) {
  this.SectionClient = SectionClient;
 }
 private String OrderFinalized;

 public String getOrderFinalized() {
  return OrderFinalized;
 }

 public void setOrderFinalized(String OrderFinalized) {
  this.OrderFinalized = OrderFinalized;
 }
 private dateTime DateTimeOrder;

 public dateTime getDateTimeOrder() {
  return DateTimeOrder;
 }

 public void setDateTimeOrder(dateTime DateTimeOrder) {
  this.DateTimeOrder = DateTimeOrder;
 }
 private bool StatusFinalized;

 public bool getStatusFinalized() {
  return StatusFinalized;
 }

 public void setStatusFinalized(bool StatusFinalized) {
  this.StatusFinalized = StatusFinalized;
 }
 private int OrderFinalized_idOrderFinalized;

 public int getOrderFinalized_idOrderFinalized() {
  return OrderFinalized_idOrderFinalized;
 }

 public void setOrderFinalized_idOrderFinalized(int OrderFinalized_idOrderFinalized) {
  this.OrderFinalized_idOrderFinalized = OrderFinalized_idOrderFinalized;
 }
 private bool ProductDelivered;

 public bool getProductDelivered() {
  return ProductDelivered;
 }

 public void setProductDelivered(bool ProductDelivered) {
  this.ProductDelivered = ProductDelivered;
 }

}
