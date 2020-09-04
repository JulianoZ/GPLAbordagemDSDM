
class BankAccount {

 private var m_customerName: String = ""


 public func  getM_customerName()  -> String { 
  return self.m_customerName
 }

 public func setM_customerName(m_customerName: String) {
  self.m_customerName = m_customerName
 }
 private var m_balance: Double = 0


 public func  getM_balance()  -> Double { 
  return self.m_balance
 }

 public func setM_balance(m_balance: Double) {
  self.m_balance = m_balance
 }
func  bankAccount()  {
}
func  bankAccount(customerName: String, balance: Double)  {
}
func  bankAccount()  {
   m_customerName = customerName
   balance = balance
}
func  bankAccount(customerName: String, balance: Double)  {
   m_customerName = customerName
   balance = balance
}
func  debit(amount: Double)  {
m_balance-=amount
}
func  credit(amount: Double)  {
m_balance+=amount
}
func  main()  -> Void {
   var vCredit: Double	     
   var vDebit: Double	     
   vCredit = 5.77
   vDebit = 11.22
   let ba =  BankAccount()	     
   ba.setM_customerName(m_customerName: m_customerName)	  
   ba.setM_balance(m_balance: m_balance)	  
   ba.credit(vCredit: vCredit)	  
   ba.debit(vDebit: vDebit)	  
   Console.WriteLine(m_balance: m_balance)	  
}

}
