
public class BankAccountTestV2 {

@Test

public void assertEqualsClassConfiguration(){
   String m_customerName;
   m_customerName = "Juliano";
   double beginningBalance;
   double debitAmount;
   double expected;
   beginningBalance = 11.99;
   debitAmount = 4.55;
   expected = 7.44;
   BankAccount account = new BankAccount();
   account.setM_customerName(m_customerName);
   account.setM_balance(beginningBalance);
   account.Debit(debitAmount);
   double actual;
   actual = account.getM_balance();
   String msg;
   msg = "Account not debited correctly";

	assertEquals(expected , actual , msg);	
}


}
