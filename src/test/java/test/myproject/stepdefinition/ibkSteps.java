package test.myproject.stepdefinition;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.api.java.eo.Se;
import gherkin.lexer.Th;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import test.myproject.base.TestBase;

import java.time.Instant;
import java.util.List;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

public class ibkSteps extends TestBase {
    private double before_transfer_account = 0;
    private double after_transfer_account = 0;
    private double d_amount = 0;
    private double accountTotal = 0;
    private double d_fee = 0;
    private String s_number = "";

    @Given("^I open (IBK|Admin) page$")
    public void iOpenHomepage(String type) throws Exception {
        if(type.equals("IBK")){
            driver.get(prop.getProperty("base.url.ibk"));
        }
        else
            driver.get(prop.getProperty("base.url.admin"));
    }

    @When("^I login ADMIN with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void iLoginADMINWithAnd(String username, String password) throws Exception {
        driver.switchTo().frame("main").switchTo().frame("tran");
        driver.findElement(By.id("txtUserName")).clear();
        driver.findElement(By.id("txtUserName")).sendKeys(username);
        driver.findElement(By.id("txtPassWord")).clear();
        driver.findElement(By.id("txtPassWord")).sendKeys(password);
        driver.findElement(By.id("btnLoginVN")).click();
        Thread.sleep(2000);
    }

    @Then("^I login (KHCN|KHDN) with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void login(String type,String userName, String passWord) throws Exception {
        driver.switchTo().frame("main").switchTo().frame("tran");
        try{
            if(driver.findElement(By.xpath("//a[@class='btn btn-warning']")).isEnabled()){
                driver.findElement(By.xpath("//a[@class='btn btn-warning']")).click();
            }
        }catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        if (type.equals("KHDN")){
            // Change tab to KHDN
            driver.findElement(By.id("tab-corp")).click();
        }
        else
        driver.findElement(By.id("txtUserName")).clear();
        driver.findElement(By.id("txtUserName")).sendKeys(userName);
        driver.findElement(By.id("txtPassKey")).clear();
        driver.findElement(By.id("txtPassKey")).sendKeys(passWord);
        driver.findElement(By.id("Login")).click();
    }

    private String getTransactionNumber () throws Exception{
        WebElement elemNumber=driver.findElement(By.xpath("//table[@class='data-table']//td[@class='msg']"));
        String transaction_number =elemNumber.getText();
        transaction_number=transaction_number.replace("Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán ","");
        transaction_number=transaction_number.replace(".","");
        s_number = String.format(transaction_number);
        return s_number;
    }

    private double getDebitAmout (String name) throws Exception{
        WebElement elemAmount=driver.findElement(By.xpath("//table[@class='data-table']//td[contains(text(),'" + name + "')]//following-sibling::td"));
        String amount=elemAmount.getText();
        amount=amount.replace("VND ","");
        amount=amount.replace(",","");
        amount=amount.replace(" VND","");
        System.out.println("==================== Amount from " + amount);
        d_amount = Double.parseDouble(amount);
        return d_amount;
    }

    private double getFeefrom (String name) throws Exception{
        WebElement elemAmount=driver.findElement(By.xpath("//table[@class='data-table']//td[contains(text(),'" + name + "')]//following-sibling::td"));
        String amount=elemAmount.getText();
        amount=amount.replace("VND ","");
        amount=amount.replace(",","");
        amount=amount.replace(" VND","");
        System.out.println("==================== Fee   " + amount);
        d_fee = Double.parseDouble(amount);
        return d_fee;
    }

    private double getAccountTotal (String name) throws Exception{
        WebElement elemBalance=driver.findElement(By.xpath("//table[@class='tableTemp']//td[@class='td-head']/p[contains(text(),'" + name + "')]//following-sibling::p"));
        String debitAmount=elemBalance.getText();
        debitAmount=debitAmount.replace(" VND","");
        debitAmount=debitAmount.replace(",","");
        debitAmount=debitAmount.replace("Dư có: ","");
//        System.out.println("==============================debitAmount " + debitAmount);
        accountTotal = Double.parseDouble(debitAmount);
        return accountTotal;
    }

    @And("^I get amount total before doing transaction$")
    public void iGetAmountTotalBeforeDoingTransaction() throws Exception{
        before_transfer_account = getAccountTotal("Tài khoản tiền gửi");
        System.out.println("before transfer account" + before_transfer_account);
    }

    @And("^I get amount total after doing transaction$")
    public void iGetAmountTotalAfterDoingTransaction() throws Exception {
        Thread.sleep(10000);
        // back to Home page
        driver.findElement(By.xpath("//li[@class='dropdown']/a[@class='js-activated']")).click();
        waitElement(By.xpath("//table[@class='tableTemp']//td[@class='td-head']/p[contains(text(),'Tài khoản tiền gửi')]"));
        after_transfer_account = getAccountTotal("Tài khoản tiền gửi");
    }

    @And("^I transfer from \"([^\"]*)\" to \"([^\"]*)\" account, \"([^\"]*)\" amount and \"([^\"]*)\" description with fee payer is \"([^\"]*)\"$")
    public void internalTransferWithSender(String fromAccount, String toAccount,String amount, String description, String feePayer) throws Exception {
        try{
            if(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("ftRequest/fundsTransfer/toAccount/accountNumber")).sendKeys(toAccount);
        driver.findElement(By.name("ftRequest/fundsTransfer/transferAmountFormat")).sendKeys(amount);
        Select feePayerList = new Select(driver.findElement(By.id("tags_charge")));
        feePayerList.selectByVisibleText(feePayer);
        driver.findElement(By.name("ftRequest/fundsTransfer/remarks")).sendKeys(description);
        driver.findElement(By.xpath("//a[@onclick='return doSubmit(myform);' and contains(text(),'Tiếp Tục')]")).click();
    }

    @Then("^I input the code to complete the transaction$")
    public void iInputTheCodeToCompleteTheTransaction() throws Exception{
        waitElement(By.xpath("//input[@type='password']"));
        driver.findElement(By.xpath("//input[@type='password']")).sendKeys("123456");
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Duyệt')]")).click();
        Thread.sleep(2000);
    }

    @And("^I verify before total amount = after total amount \\+ debit amount$")
    public void iVerifyBeforeTotalAmountAfterTotalAmountDebitAmount() throws Exception {
        System.out.println("***************after_transfer_account  " + after_transfer_account);
        System.out.println("***************before_transfer_account  " + before_transfer_account);
        System.out.println("***************debitAmount  " + d_amount);
        assertEquals(before_transfer_account,after_transfer_account + d_amount);

    }

    @And("^I verify before total amount = after total amount \\+ debit amount \\+ fee$")
    public void iVerifyBeforeTotalAmountAfterTotalAmountDebitAmountFee() throws Exception {
        System.out.println("***************after_transfer_account  " + after_transfer_account);
        System.out.println("***************before_transfer_account  " + before_transfer_account);
        System.out.println("***************debit_Amount  " + d_amount);
        System.out.println("***************Fee  " + d_fee);
        assertEquals(before_transfer_account,after_transfer_account + d_amount + d_fee);
    }

    @And("^I do transaction with type is \"([^\"]*)\" and \"([^\"]*)\"$")
    public void iDoTransactionWithTypeIs(String type1, String type2) throws Exception {
        transferType(type1,type2);
    }

    @And("^I transfer from \"([^\"]*)\" with \"([^\"]*)\" amount to \"([^\"]*)\" account number, \"([^\"]*)\" account name, \"([^\"]*)\" bank name, \"([^\"]*)\" city, \"([^\"]*)\" branch, \"([^\"]*)\" fee payer and \"([^\"]*)\" description$")
    public void iTransferFromWithAmountToAccountNumberAccountNameBankNameCityBranchFeePayerAndDescription(String fromAccount, String amount, String accountNumber, String accountName, String bankName, String city, String branch, String feePayer, String description) throws Exception {
        try{
            if(driver.findElement(By.name("remittanceRequest/remittance/customerAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("remittanceRequest/remittance/customerAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.id("id_tempBenAmountFormat")).sendKeys(amount);
        driver.findElement(By.id("id_toaccount")).sendKeys(accountNumber);
        driver.findElement(By.id("id_name")).sendKeys(accountName);
        // Choose bank name
        driver.findElement(By.id("id_bankname")).click();
        waitElement(By.id("id_bankname"));
        driver.findElement(By.id("id_bankname")).sendKeys(bankName);
        Thread.sleep(1000);
        List<WebElement> bankNameList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='description']/span"));
        for (int i = 0; i < bankNameList.size(); i++) {
            System.out.println("bank name list ============   " + bankNameList.get(i).getText());
            if (bankNameList.get(i).getText().equals(bankName)) {
                bankNameList.get(i).click();
                Thread.sleep(1000);
            }
        }
        // Choose city
        driver.findElement(By.id("id_bankcityname")).click();
        Thread.sleep(1000);
        driver.findElement(By.id("id_bankcityname")).sendKeys(city);
        Thread.sleep(1000);
        List<WebElement> bankCityList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='description']/span"));
        for (int i = 0; i < bankCityList.size(); i++) {
            System.out.println("bank city list ============   " + bankCityList.get(i).getText());
            if (bankCityList.get(i).getText().equals(city)) {
                bankCityList.get(i).click();
                Thread.sleep(1000);
            }
        }
        // Choose branch
        driver.findElement(By.id("id_bankbranchname")).click();
        Thread.sleep(1000);
        driver.findElement(By.id("id_bankbranchname")).sendKeys(branch);
        Thread.sleep(1000);
        List<WebElement> bankBranchList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='description']/span"));
        for (int i = 0; i < bankBranchList.size(); i++) {
            System.out.println("bank branch list ============   " + bankBranchList.get(i).getText());
            if (bankBranchList.get(i).getText().equals(branch)) {
                bankBranchList.get(i).click();
                Thread.sleep(1000);
            }
        }
        List<WebElement> feePayerList = driver.findElements(By.xpath("//table[@class='data-table']//td[@class='val']//option"));
        for (int i = 0; i < feePayerList.size(); i++) {
            System.out.println("Fee Payer list ============   " + feePayerList.get(i).getText());
            if (feePayerList.get(i).getText().equals(feePayer)) {
                Thread.sleep(1000);
                feePayerList.get(i).click();
            }
        }
        driver.findElement(By.name("remittanceRequest/remittance/paymentDetails1")).sendKeys(description);
        driver.findElement(By.xpath("//a[@onclick='confirmLoopRemittance();' and contains(text(),'Tiếp Tục')]")).click();
    }

    @Then("^I verify \"([^\"]*)\" \"([^\"]*)\" is displayed after doing transaction successfully$")
    public void iVerifyIsDisplayedAfterDoingTransactionSuccessfully(String text1, String text2) throws Exception {
        waitElement(By.xpath("//table[@class='data-table']"));
        String actualString = driver.findElement(By.xpath("//table[@class='data-table']")).getText();
//        System.out.println("**************** Data table" + actualString);
        assertTrue(actualString.contains(text1));
        assertTrue(actualString.contains(text2));
    }

    @Then("^I verify \"([^\"]*)\" \"([^\"]*)\" is displayed in mini statement$")
    public void iVerifyIsDisplayedInMiniStatement(String text1, String text2) throws Exception {
        waitElement(By.xpath("//table[@class='tableTemp']"));
        String actualString = driver.findElement(By.xpath("//table[@class='tableTemp']")).getText();
        System.out.println("**************** Data table" + actualString);
        assertTrue(actualString.contains(text1));
        assertTrue(actualString.contains(text2));
    }

    @Then("^I search the above transaction$")
    public void searchTransaction() throws Exception {
        waitElement(By.id("chk_0"));
        driver.findElement(By.id("chk_0")).click();
        waitElement(By.xpath("//div[@class='div-group-button']/a[@onclick='  doApprovalAccept(document.forms[0]);']"));
        driver.findElement(By.xpath("//div[@class='div-group-button']/a[@onclick='  doApprovalAccept(document.forms[0]);']")).click();
        Thread.sleep(2000);
    }

    @Then("^I (approve|decline) the above transaction$")
    public void approveOrDeclineTransaction(String type) throws Exception {
        if(type.equals("approve")) {
            driver.findElement(By.xpath("//input[@type='password']")).sendKeys("123456");
            driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Duyệt')]")).click();
            Thread.sleep(3000);
        }
    }

    @And("^I get \"([^\"]*)\" debit amount from above transaction$")
    public void iGetAmountFromAboveTransaction(String name) throws Exception {
       getDebitAmout(name);
    }

    @And("^I upload \"([^\"]*)\" file to do transferring by \"([^\"]*)\" with separated to single transaction is \"([^\"]*)\"$")
    public void iUploadFile(String filePath, String type, String split) throws Exception {
        if(type.equals("bulk local") && split.equals("No")){
            waitElement(By.name("FILENAME"));
            driver.findElement(By.name("FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.name("REMARKS")).sendKeys("AUTO DESCRIPTION" + " " + Instant.now().getEpochSecond());
            driver.findElement(By.xpath("//div[@class='div-group-button']/a[@onclick='return doSubmit(BULKFUNDSTRANSFERFORM);']")).click();
        }
        else if(type.equals("identity card")&& split.equals("No")) {
            try{
                waitElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber"));
                Select accountList = new Select(driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")));
                accountList.selectByVisibleText("045704070000966 (CTY CP HOANG YEN) - VND");
            }
            catch (Exception e) {System.out.println("Error msg: " + e.getMessage());}
            waitElement(By.name("BulkCMNDRequest/bulkCMND/FILENAME"));
            driver.findElement(By.name("BulkCMNDRequest/bulkCMND/FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.name("BulkCMNDRequest/bulkCMND/narative")).sendKeys("AUTO DESCRIPTION" + " " + Instant.now().getEpochSecond());
            driver.findElement(By.id("kkkkkout")).click();
        }
        else if (type.equals("payment of wages")&& split.equals("No")){
            waitElement(By.name("FILENAME"));
            driver.findElement(By.name("FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.xpath("//div[@class='div-group-button']/a[@onclick=' return doSubmit(BULKFUNDSTRANSFERFORM);']")).click();
        }
        else if(type.equals("payment of wages") && split.equals("Yes")){
            waitElement(By.name("FILENAME"));
            driver.findElement(By.name("FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.id("Sliptchck")).click();
            driver.findElement(By.xpath("//div[@class='div-group-button']/a[@onclick=' return doSubmit(BULKFUNDSTRANSFERFORM);']")).click();
        }

    }

    @And("^I choose \"([^\"]*)\" account$")
    public void iChooseAccount(String account) throws Exception {
        try{
            if(driver.findElement(By.name("ACCOUNTNO")).isEnabled()){
                Select listAccount =new Select(driver.findElement(By.name("ACCOUNTNO")));
                listAccount.selectByVisibleText(account);
            }
        }
        catch (Exception e){System.out.println("Error message: " + e.getMessage());}
        driver.findElement(By.id("kkkkkout")).click();
    }

    @Then("^I top up from \"([^\"]*)\" to \"([^\"]*)\" agent code with \"([^\"]*)\" amount of payment and \"([^\"]*)\" note$")
    public void iTopUpFromToAgentCodeWithAmountOfPayment(String fromAccount, String agentCode, String amount, String note) throws Exception {
        try{
            if(driver.findElement(By.name("ip_from_account")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("ip_from_account")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.id("id_agent")).sendKeys(agentCode);
        Thread.sleep(1000);
        driver.findElement(By.xpath("//li[@class='ui-menu-item']")).click();
        Thread.sleep(1000);
        driver.findElement(By.xpath("//input[@onkeyup='convertCyy(this,document.forms[0].elements[\"ip_amount\"])']")).sendKeys(amount);
        driver.findElement(By.id("id_remarks")).sendKeys(note);
        driver.findElement(By.xpath("//a[@onclick='return doSubmit(document.forms[0]);']")).click();
    }

    @Then("^I pay from \"([^\"]*)\" with \"([^\"]*)\" service type, \"([^\"]*)\" service provider, \"([^\"]*)\" customer code and \"([^\"]*)\" note$")
    public void iPayFromWithServiceTypeServiceProviderCustomerCodeAndNote(String fromAccount, String serviceType, String serviceProvider, String code, String note) throws Exception {
        try{
            if(driver.findElement(By.name("bpRequest/debitAccount/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("bpRequest/debitAccount/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        Select listServiceType =new Select(driver.findElement(By.name("bpRequest/ServiceTypes")));
        listServiceType.selectByVisibleText(serviceType);
        Select listServiceProvider =new Select(driver.findElement(By.name("bpRequest/provider/Providers")));
        listServiceProvider.selectByVisibleText(serviceProvider);
        driver.findElement(By.id("autofield")).sendKeys(code);
        driver.findElement(By.name("bpRequest/remarks")).sendKeys(note);
        driver.findElement(By.xpath("//a[@onclick='return doSubmit(document.forms[0]);']")).click();
    }

    @Then("^I transfer from \"([^\"]*)\" to \"([^\"]*)\", \"([^\"]*)\" amount, \"([^\"]*)\" name, \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" start date, \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" end date, \"([^\"]*)\" \"([^\"]*)\" frequency and \"([^\"]*)\" notice$")
    public void iTransferFromToAmountNameStartDateEndDateFrequencyAndNotice(String fromAccount, String toAccount, String amount, String name, String startDay, String startMonth, String startYear, String endDay, String endMonth, String endYear, String freTime, String feeMonth, String notice) throws Exception {
        try{
            if(driver.findElement(By.name("FROMACCOUNT")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("FROMACCOUNT")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("TOACCOUNT")).sendKeys(toAccount);
        driver.findElement(By.name("TRANSFERAMOUNTFORMAT")).sendKeys(amount);
        driver.findElement(By.name("SCHEDULENAME")).sendKeys(name + " " + Instant.now().getEpochSecond());
        driver.findElement(By.name("STARTDAY")).clear();
        driver.findElement(By.name("STARTDAY")).sendKeys(startDay);
        driver.findElement(By.name("STARTMONTH")).clear();
        driver.findElement(By.name("STARTMONTH")).sendKeys(startMonth);
        driver.findElement(By.name("STARTYEAR")).clear();
        driver.findElement(By.name("STARTYEAR")).sendKeys(startYear);
        driver.findElement(By.name("ENDDAY")).clear();
        driver.findElement(By.name("ENDDAY")).sendKeys(endDay);
        driver.findElement(By.name("ENDMONTH")).clear();
        driver.findElement(By.name("ENDMONTH")).sendKeys(endMonth);
        driver.findElement(By.name("ENDYEAR")).clear();
        driver.findElement(By.name("ENDYEAR")).sendKeys(endYear);
        driver.findElement(By.name("PERIOD")).clear();
        driver.findElement(By.name("PERIOD")).sendKeys(freTime);
        driver.findElement(By.name("PERIODFREQUENCY")).sendKeys(feeMonth);
        Select listNotice = new Select(driver.findElement(By.name("NOTIFICATION")));
        listNotice.selectByVisibleText(notice);
        driver.findElement(By.xpath("//a[@onclick='return doSubmit(myform)']")).click();
    }

    @Then("^I transfer from \"([^\"]*)\" with \"([^\"]*)\" amount to \"([^\"]*)\" account number, \"([^\"]*)\" account name, \"([^\"]*)\" bank name, \"([^\"]*)\" city, \"([^\"]*)\" branch, \"([^\"]*)\" fee payer and \"([^\"]*)\" description, \"([^\"]*)\" name, \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" start date, \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" end date, \"([^\"]*)\" \"([^\"]*)\" frequency and \"([^\"]*)\" notice$")
    public void iTransferScheduleLocalTransfer(String fromAccount, String amount, String toAccount, String accountName, String bankName, String city, String branch, String feePayer, String description, String name, String startDay, String startMonth, String startYear, String endDay, String endMonth, String endYear, String freTime, String feeMonth, String notice) throws Exception {
        try{
            if(driver.findElement(By.name("recurringRequest/recurringRemit/customerAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("recurringRequest/recurringRemit/customerAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("amountFormat")).clear();
        driver.findElement(By.name("amountFormat")).sendKeys(amount);
        driver.findElement(By.name("recurringRequest/recurringRemit/ftDetails/beneficiaryAccountNumber")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/ftDetails/beneficiaryAccountNumber")).sendKeys(toAccount);
        driver.findElement(By.name("recurringRequest/recurringRemit/id_benname")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/id_benname")).sendKeys(accountName);
        // Choose bank name
        driver.findElement(By.id("id_bankname")).click();
        waitElement(By.id("id_bankname"));
        driver.findElement(By.id("id_bankname")).sendKeys(bankName);
        Thread.sleep(1000);
        List<WebElement> bankNameList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='description']/span"));
        for (int i = 0; i < bankNameList.size(); i++) {
            System.out.println("bank name list ============   " + bankNameList.get(i).getText());
            if (bankNameList.get(i).getText().equals(bankName)) {
                bankNameList.get(i).click();
                Thread.sleep(1000);
            }
        }
        // Choose city
        driver.findElement(By.id("id_bankcityname")).click();
        Thread.sleep(1000);
        driver.findElement(By.id("id_bankcityname")).sendKeys(city);
        Thread.sleep(1000);
        List<WebElement> bankCityList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='description']/span"));
        for (int i = 0; i < bankCityList.size(); i++) {
            System.out.println("bank city list ============   " + bankCityList.get(i).getText());
            if (bankCityList.get(i).getText().equals(city)) {
                bankCityList.get(i).click();
                Thread.sleep(1000);
            }
        }
        // Choose branch
        driver.findElement(By.id("id_bankbranchname")).click();
        Thread.sleep(1000);
        driver.findElement(By.id("id_bankbranchname")).sendKeys(branch);
        Thread.sleep(1000);
        List<WebElement> bankBranchList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='description']/span"));
        for (int i = 0; i < bankBranchList.size(); i++) {
            System.out.println("bank branch list ============   " + bankBranchList.get(i).getText());
            if (bankBranchList.get(i).getText().equals(branch)) {
                bankBranchList.get(i).click();
                Thread.sleep(1000);
            }
        }
        Select feePayerList = new Select(driver.findElement(By.id("tags_charge")));
        feePayerList.selectByVisibleText(feePayer);
        driver.findElement(By.name("recurringRequest/recurringRemit/paymentDetails1")).sendKeys(description);
        driver.findElement(By.name("recurringRequest/recurringRemit/scheduleName")).sendKeys(name);
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/day")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/day")).sendKeys(startDay);
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/month")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/month")).sendKeys(startMonth);
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/year")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/year")).sendKeys(startYear);
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/day")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/day")).sendKeys(endDay);
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/month")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/month")).sendKeys(endMonth);
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/year")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/year")).sendKeys(endYear);
        driver.findElement(By.name("FREQNUM")).clear();
        driver.findElement(By.name("FREQNUM")).sendKeys(freTime);
        driver.findElement(By.name("FREQLIST")).sendKeys(feeMonth);
        Select listNotice = new Select(driver.findElement(By.name("recurringRequest/recurringRemit/notice")));
        listNotice.selectByVisibleText(notice);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();

    }

    @And("^I get \"([^\"]*)\" fee from above transaction$")
    public void iGetFeeFromTransaction(String name) throws Exception {
            getFeefrom(name);
    }

    @And("^I transfer from \"([^\"]*)\" with \"([^\"]*)\" transaction type, \"([^\"]*)\" number, \"([^\"]*)\" bank, \"([^\"]*)\" amount and \"([^\"]*)\" description$")
    public void iTransferFromWithTransactionTypeCardNumberAmountAndDescription(String fromAccount, String type, String cardNumber, String bank, String amount, String description) throws Exception {
        try{
            if(driver.findElement(By.name("IBFTRequest/IbftObject/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("IBFTRequest/IbftObject/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        switch (type){
            case "Chuyển đến Thẻ":
                Select cardList = new Select(driver.findElement(By.name("TransactionType")));
                cardList.selectByVisibleText(type);
                driver.findElement(By.name("IBFTRequest/IbftObject/toAccount/accountNumber")).sendKeys(cardNumber);
                driver.findElement(By.name("IBFTRequest/IbftObject/amountFormat")).sendKeys(amount);
                driver.findElement(By.name("IBFTRequest/IbftObject/remarks")).sendKeys(description);
                driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
                Thread.sleep(3000);
                break;
            case "Chuyển đến Tài Khoản":
                Select accountList = new Select(driver.findElement(By.name("TransactionType")));
                accountList.selectByVisibleText(type);
                driver.findElement(By.id("tags")).sendKeys(cardNumber);
                driver.findElement(By.id("benBankAuto")).sendKeys(bank);
                driver.findElement(By.name("IBFTRequest/IbftObject/amountFormat")).sendKeys(amount);
                driver.findElement(By.name("IBFTRequest/IbftObject/remarks")).sendKeys(description);
                driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
                Thread.sleep(3000);
                break;
        }
    }

    @And("^I transfer from \"([^\"]*)\" with \"([^\"]*)\" amount, \"([^\"]*)\" name, \"([^\"]*)\" Identification type, \"([^\"]*)\" ID/PASSPORT, \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" Date of issuance, \"([^\"]*)\" Place of issuance, \"([^\"]*)\" fee charged and \"([^\"]*)\" description$")
    public void iTransferFromWithAmountNameIdentificationTypeIDPASSPORTDateOfIssuancePlaceOfIssuanceFeeChargedAndDescription(String fromAccount, String amount, String name, String type, String id, String day, String month, String year, String place, String fee, String description) throws Exception {
        try {
            if (driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")).isEnabled()) {
                Select accountList = new Select(driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.id("kkkkkout")).sendKeys(amount);
        driver.findElement(By.id("id_cmnd_name")).sendKeys(name);
        Select identificationTypeList = new Select(driver.findElement(By.id("id_cmnd_type")));
        identificationTypeList.selectByVisibleText(type);
        driver.findElement(By.id("id_cmnd_id")).sendKeys(id);
        driver.findElement(By.id("id_cmnd_day")).clear();
        driver.findElement(By.id("id_cmnd_day")).sendKeys(day);
        driver.findElement(By.id("id_cmnd_month")).clear();
        driver.findElement(By.id("id_cmnd_month")).sendKeys(month);
        driver.findElement(By.id("id_cmnd_year")).clear();
        driver.findElement(By.id("id_cmnd_year")).sendKeys(year);
        driver.findElement(By.id("id_cmnd_place")).sendKeys(place);
        Select feeList = new Select(driver.findElement(By.name("BulkCMNDRequest/bulkCMND/bulkDetail/charge_to")));
        feeList.selectByVisibleText(fee);
        driver.findElement(By.name("BulkCMNDRequest/bulkCMND/bulkDetail/narative")).sendKeys(description);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
    }

    @And("^I get transaction number$")
    public void iGetTransactionNumber() throws Exception {
        getTransactionNumber();
    }

    @And("^I verify the number transaction is displayed \"([^\"]*)\" table in Home page$")
    public void iVerifyTheNumberTransactionIsDisplayedTable(String name) throws Exception {
        // back to Home page
        driver.findElement(By.xpath("//li[@class='dropdown']/a[@class='js-activated']")).click();
        waitElement(By.xpath("//table[@class='tableTemp']//tr[@class='tableData']"));
        WebElement elemTableList = driver.findElement(By.xpath("//table[@class='tableTemp']//tr[@class='tableData']"));
        String tableList = elemTableList.getText();
        System.out.println("============ data Table" + tableList);
        System.out.println("============ transaction_number" + s_number);
        assertTrue(tableList.contains(s_number));
    }
}
