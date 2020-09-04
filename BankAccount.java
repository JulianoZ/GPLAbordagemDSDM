
public class BankAccount {

 private string m_customerName;

 public string getM_customerName() {
  return m_customerName;
 }

 public void setM_customerName(string m_customerName) {
  this.m_customerName = m_customerName;
 }
 private double m_balance;

 public double getM_balance() {
  return m_balance;
 }

 public void setM_balance(double m_balance) {
  this.m_balance = m_balance;
 }
public  bankAccount() {
}

public  bankAccount(string customerName, double balance) {
}

public  bankAccount() {
   m_customerName = customerName;
   balance = balance;
}

public  bankAccount(string customerName, double balance) {
   m_customerName = customerName;
   balance = balance;
}

public  debit(double amount) {
m_balance-=amount
}

public  credit(double amount) {
m_balance+=amount
}

public void main() {
   double vCredit;
   double vDebit;
   vCredit = 5.77;
   vDebit = 11.22;
   BankAccount ba = new BankAccount();
   ba.setM_customerName(m_customerName);
   ba.setM_balance(m_balance);
   ba.credit(vCredit);
   ba.debit(vDebit);
   Console.WriteLine(m_balance);
}


}
