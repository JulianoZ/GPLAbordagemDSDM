
class BankAccountTestV2 {


func assertEqualsClassConfiguration()  -> Void{
   var m_customerName: String	     
   m_customerName = "Juliano"
   var beginningBalance: Double	     
   var debitAmount: Double	     
   var expected: Double	     
   beginningBalance = 11.99
   debitAmount = 4.55
   expected = 7.44
   let account =  BankAccount()	     
   account.setM_customerName(m_customerName: m_customerName)	  
   account.setM_balance(beginningBalance: beginningBalance)	  
   account.Debit(debitAmount: debitAmount)	  
   var actual: Double	     
   actual = account.getM_balance()
   var msg: String	     
   msg = "Account not debited correctly"

	XCTAssertEqual(expected , actual , msg);	
}


}
