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
import test.myproject.base.Hooks;
import test.myproject.base.TestBase;
import test.myproject.utils.DataHelper;

import java.text.DecimalFormat;
import java.text.Format;
import java.time.Instant;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

public class ibkSteps extends TestBase {
    private double before_transfer_account = 0;
    private double after_transfer_account = 0;
    private double d_amount = 0;
    private double accountTotal = 0;
    private double d_fee = 0;
    private String s_number = "";
    private double d_bulkFee = 0;
    private double d_transaction_total = 0;

    public List<HashMap<String,String>> datamap;
    public ibkSteps()
    {
        datamap = DataHelper.data(System.getProperty("user.dir")+"//data//userdata.xlsx","Sheet1");
    }

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

    @Then("^I login KHCN with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void loginKHCN(String userName, String passWord) throws Exception {
            driver.switchTo().frame("main").switchTo().frame("tran");
//        try{
//            if(driver.findElement(By.xpath("//a[@class='btn btn-warning']")).isEnabled()){
//                driver.findElement(By.xpath("//a[@class='btn btn-warning']")).click();
//            }
//        }catch (Exception e){System.out.println("Error:  " + e.getMessage());}
            driver.findElement(By.id("txtUserName")).clear();
            driver.findElement(By.id("txtUserName")).sendKeys(datamap.get(0).get("userKHCN"));
            driver.findElement(By.id("txtPassKey")).clear();
            driver.findElement(By.id("txtPassKey")).sendKeys(datamap.get(0).get("password"));
            driver.findElement(By.id("Login")).click();
    }

    @Then("^As an (input|approval) user, I login KHDN with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void loginKHDN(String type,String userName, String passWord) throws Exception {
        driver.switchTo().frame("main").switchTo().frame("tran");
        //Close Popup
//        try{
//            if(driver.findElement(By.xpath("//a[@class='btn btn-warning']")).isEnabled()){
//                driver.findElement(By.xpath("//a[@class='btn btn-warning']")).click();
//            }
//        }catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        // Change tab to KHDN
        driver.findElement(By.id("tab-corp")).click();
        if (type.equals("input")){
            driver.findElement(By.id("txtUserName")).clear();
            driver.findElement(By.id("txtUserName")).sendKeys(datamap.get(0).get("userKHDNnhap"));
        }
        else{
            driver.findElement(By.id("txtUserName")).clear();
            driver.findElement(By.id("txtUserName")).sendKeys(datamap.get(0).get("userKHDNduyet"));
        }
        driver.findElement(By.id("txtPassKey")).clear();
        driver.findElement(By.id("txtPassKey")).sendKeys(datamap.get(0).get("password"));
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
        System.out.println("==================== Debit amount " + amount);
        d_amount = Double.parseDouble(amount);
        return d_amount;
    }

    private double getTransactionNumber (String name) throws Exception{
        WebElement elemAmount=driver.findElement(By.xpath("//table[@class='data-table']//td[contains(text(),'" + name + "')]//following-sibling::td"));
        String amount=elemAmount.getText();
        System.out.println("==================== Transaction total " + amount);
        d_transaction_total = Double.parseDouble(amount);
        return d_transaction_total;
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
        System.out.println("==============================Amount total in Home " + debitAmount);
        accountTotal = Double.parseDouble(debitAmount);
        return accountTotal;
    }

    private String getBulkFee () throws Exception{
        String bulkFee = driver.findElement(By.xpath("//table[@class='tableTemp']//tr[2]/td[3]")).getText();
        bulkFee = bulkFee.replace("Số tiền chuyển: VND 20,000,000","");
        bulkFee = bulkFee.replace("Tính phí: Bên chuyển","");
        bulkFee = bulkFee.replace("Phí: VND ","");
        bulkFee = bulkFee.replace(",","");
        System.out.println("==============================bulkFee " + bulkFee );
        d_bulkFee = Double.parseDouble(bulkFee);
        return bulkFee;
    }

    @And("^I get amount total before doing transaction$")
    public void iGetAmountTotalBeforeDoingTransaction() throws Exception{
        waitElement(By.xpath("//table[@class='tableTemp']//td[@class='td-head']/p[contains(text(),'Tài khoản tiền gửi')]//following-sibling::p"));
        before_transfer_account = getAccountTotal("Tài khoản tiền gửi");
        DecimalFormat decimalFormat = new DecimalFormat("#");
        String test = decimalFormat.format(before_transfer_account);
        System.out.println("----------------------before transfer account " + test);
    }

    @And("^I get amount total after doing transaction$")
    public void iGetAmountTotalAfterDoingTransaction() throws Exception {
        Thread.sleep(30000);
        // back to Home page
        driver.findElement(By.xpath("//li[@class='dropdown']/a[@class='js-activated']")).click();
        waitElement(By.xpath("//table[@class='tableTemp']//td[@class='td-head']/p[contains(text(),'Tài khoản tiền gửi')]"));
        after_transfer_account = getAccountTotal("Tài khoản tiền gửi");
        DecimalFormat decimalFormat = new DecimalFormat("#");
        String test = decimalFormat.format(after_transfer_account);
        System.out.println("----------------------after transfer account " + test);
    }

    @And("^As (KHCN|KHDN), I transfer from \"([^\"]*)\" to \"([^\"]*)\" account, \"([^\"]*)\" amount and \"([^\"]*)\" description with fee payer is \"([^\"]*)\"$")
    public void internalTransferWithSender(String type,String fromAccount, String toAccount,String amount, String description, String feePayer) throws Exception {
        try{
            if(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")));
                if(type.equals("KHCN")){
                    accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHCN"));
                }
                else{
                    accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHDN"));
                }
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("ftRequest/fundsTransfer/toAccount/accountNumber")).sendKeys(toAccount);
        driver.findElement(By.name("ftRequest/fundsTransfer/transferAmountFormat")).sendKeys(amount);
        Select feePayerList = new Select(driver.findElement(By.id("tags_charge")));
        feePayerList.selectByVisibleText(feePayer);
        driver.findElement(By.name("ftRequest/fundsTransfer/remarks")).sendKeys(description);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
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
//        System.out.println("***************after_transfer_account  " + after_transfer_account);
//        System.out.println("***************before_transfer_account  " + before_transfer_account);
//        System.out.println("***************debitAmount  " + d_amount);
        assertEquals(before_transfer_account,after_transfer_account + d_amount);

    }

    @And("^I verify before total amount = after total amount \\+ debit amount \\+ fee$")
    public void iVerifyBeforeTotalAmountAfterTotalAmountDebitAmountFee() throws Exception {
//        System.out.println("***************after_transfer_account  " + after_transfer_account);
//        System.out.println("***************before_transfer_account  " + before_transfer_account);
//        System.out.println("***************debit_Amount  " + d_amount);
//        System.out.println("***************Fee  " + d_fee);
        assertEquals(before_transfer_account,after_transfer_account + d_amount + d_fee);
    }

    @And("^I verify before total amount = after total amount \\+ debit amount \\+ fee when upload file$")
    public void verifyAmounTotalAfterUploadFile() throws Exception {
//        System.out.println("***************after_transfer_account  " + after_transfer_account);
//        System.out.println("***************before_transfer_account  " + before_transfer_account);
//        System.out.println("***************debit_Amount  " + d_amount);
//        System.out.println("***************Fee  " + d_transaction_total);
//        System.out.println("***************Bulk Fee  " + d_bulkFee);
        assertEquals(before_transfer_account,after_transfer_account + d_amount + d_transaction_total * d_bulkFee);
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
            if (bankBranchList.get(i).getText().equals(branch)) {
                bankBranchList.get(i).click();
                Thread.sleep(1000);
            }
        }
        List<WebElement> feePayerList = driver.findElements(By.xpath("//table[@class='data-table']//td[@class='val']//option"));
        for (int i = 0; i < feePayerList.size(); i++) {
            if (feePayerList.get(i).getText().equals(feePayer)) {
                Thread.sleep(1000);
                feePayerList.get(i).click();
            }
        }
        driver.findElement(By.name("remittanceRequest/remittance/paymentDetails1")).sendKeys(description);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
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
//        System.out.println("**************** Data table" + actualString);
        assertTrue(actualString.contains(text1));
        assertTrue(actualString.contains(text2));
    }

    @Then("^I search the above transaction$")
    public void searchTransaction() throws Exception {
        waitElement(By.id("chk_0"));
        driver.findElement(By.id("chk_0")).click();
        waitElement(By.xpath("//div[@class='div-group-button']/a[@onclick='  doApprovalAccept(document.forms[0]);']"));
        driver.findElement(By.xpath("//div[@class='div-group-button']/a[@onclick='  doApprovalAccept(document.forms[0]);']")).click();
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
            driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
        }
        else if (type.equals("payment of wages")&& split.equals("No")){
            waitElement(By.name("FILENAME"));
            driver.findElement(By.name("FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
        }
        else if(type.equals("payment of wages") && split.equals("Yes")){
            waitElement(By.name("FILENAME"));
            driver.findElement(By.name("FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.id("Sliptchck")).click();
            driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
        }
    }

    @And("^I upload \"([^\"]*)\" file from \"([^\"]*)\" account to do transferring by \"([^\"]*)\" with separated to single transaction is \"([^\"]*)\"$")
    public void iUploadFileFromAccountToDoTransferringByWithSeparatedToSingleTransactionIs(String filePath, String fromAccount, String type, String split) throws Exception {
        try{
            if(driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")).isDisplayed()){
                Select accountList = new Select(driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e) {System.out.println("Error msg: " + e.getMessage());}
        if(type.equals("identity card") && split.equals("No")) {
            waitElement(By.name("BulkCMNDRequest/bulkCMND/FILENAME"));
            driver.findElement(By.name("BulkCMNDRequest/bulkCMND/FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
            driver.findElement(By.name("BulkCMNDRequest/bulkCMND/narative")).sendKeys("AUTO DESCRIPTION" + " " + Instant.now().getEpochSecond());
            driver.findElement(By.id("kkkkkout")).click();
        }
          else if(type.equals("identity card") && split.equals("Yes")){
              waitElement(By.name("BulkCMNDRequest/bulkCMND/FILENAME"));
              driver.findElement(By.name("BulkCMNDRequest/bulkCMND/FILENAME")).sendKeys(System.getProperty("user.dir") + filePath);
              driver.findElement(By.id("Sliptchck")).click();
              driver.findElement(By.name("BulkCMNDRequest/bulkCMND/narative")).sendKeys("AUTO DESCRIPTION" + " " + Instant.now().getEpochSecond());
              driver.findElement(By.id("kkkkkout")).click();
          }
    }

    @And("^As (KHCN|KHDN), I choose \"([^\"]*)\" account$")
    public void iChooseAccount(String type, String account) throws Exception {
        try{
            if(driver.findElement(By.name("ACCOUNTNO")).isEnabled()){
                Select listAccount =new Select(driver.findElement(By.name("ACCOUNTNO")));
                if(type.equals("KHCN")){
                    listAccount.selectByVisibleText(datamap.get(0).get("fromaccountKHCN"));
                }
                else{
                    listAccount.selectByVisibleText(datamap.get(0).get("fromaccountKHDN"));
                }
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
        driver.findElement(By.id("ip_amountformat")).sendKeys(amount);
        driver.findElement(By.id("id_remarks")).sendKeys(note);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
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
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
    }

    @Then("^As (KHCN|KHDN), I transfer from \"([^\"]*)\" to \"([^\"]*)\", \"([^\"]*)\" amount, \"([^\"]*)\" name, \"([^\"]*)\" \"([^\"]*)\" frequency and \"([^\"]*)\" notice$")
    public void iTransferFromToAmountNameStartDateEndDateFrequencyAndNotice(String type, String fromAccount, String toAccount, String amount, String name, String freTime, String feeMonth, String notice) throws Exception {
            try{
                if(driver.findElement(By.name("FROMACCOUNT")).isEnabled()){
                    Select accountList = new Select(driver.findElement(By.name("FROMACCOUNT")));
                    if(type.equals("KHDN")){
                        accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHDN"));
                    }
                    else{
                        accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHCN"));
                    }
                }
            }
            catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("TOACCOUNT")).sendKeys(toAccount);
        driver.findElement(By.name("TRANSFERAMOUNTFORMAT")).sendKeys(amount);
        driver.findElement(By.name("SCHEDULENAME")).sendKeys(name + " " + Instant.now().getEpochSecond());
        Calendar now = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        String s_day = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
        String s_month = String.valueOf(now.get(Calendar.MONTH) + 1);
        if(s_month.length()==1){
            String s_extra_month = 0 + s_month;
            driver.findElement(By.name("STARTMONTH")).clear();
            driver.findElement(By.name("STARTMONTH")).sendKeys(s_extra_month);
        }
        else{
            driver.findElement(By.name("STARTMONTH")).clear();
            driver.findElement(By.name("STARTMONTH")).sendKeys(s_month);
        }
        String s_year = String.valueOf(now.get(Calendar.YEAR));
        String e_day = String.valueOf(now.get(Calendar.DAY_OF_MONTH) + 1);
        String e_month = String.valueOf(now.get(Calendar.MONTH) + 1);
        String e_year = String.valueOf(now.get(Calendar.YEAR));
        driver.findElement(By.name("STARTDAY")).clear();
        driver.findElement(By.name("STARTDAY")).sendKeys(s_day);
//        driver.findElement(By.name("STARTMONTH")).clear();
//        driver.findElement(By.name("STARTMONTH")).sendKeys(s_month);
        driver.findElement(By.name("STARTYEAR")).clear();
        driver.findElement(By.name("STARTYEAR")).sendKeys(s_year);
        driver.findElement(By.name("ENDDAY")).clear();
        driver.findElement(By.name("ENDDAY")).sendKeys(e_day);
//        driver.findElement(By.name("ENDMONTH")).clear();
//        driver.findElement(By.name("ENDMONTH")).sendKeys(e_month);
        if(e_month.length()==1){
            String e_extra_month = 0 + e_month;
            driver.findElement(By.name("STARTMONTH")).clear();
            driver.findElement(By.name("STARTMONTH")).sendKeys(e_extra_month);
        }
        else{
            driver.findElement(By.name("STARTMONTH")).clear();
            driver.findElement(By.name("STARTMONTH")).sendKeys(e_month);
        }
        driver.findElement(By.name("ENDYEAR")).clear();
        driver.findElement(By.name("ENDYEAR")).sendKeys(e_year);
        driver.findElement(By.name("PERIOD")).clear();
        driver.findElement(By.name("PERIOD")).sendKeys(freTime);
        driver.findElement(By.name("PERIODFREQUENCY")).sendKeys(feeMonth);
        Select listNotice = new Select(driver.findElement(By.name("NOTIFICATION")));
        listNotice.selectByVisibleText(notice);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
    }

    @Then("^As (KHCN|KHDN), I transfer from \"([^\"]*)\" with \"([^\"]*)\" amount to \"([^\"]*)\" account number, \"([^\"]*)\" account name, \"([^\"]*)\" bank name, \"([^\"]*)\" city, \"([^\"]*)\" branch, \"([^\"]*)\" fee payer and \"([^\"]*)\" description, \"([^\"]*)\" name, \"([^\"]*)\" \"([^\"]*)\" frequency and \"([^\"]*)\" notice$")
    public void iTransferScheduleLocalTransfer(String type, String fromAccount, String amount, String toAccount, String accountName, String bankName, String city, String branch, String feePayer, String description, String name, String freTime, String feeMonth, String notice) throws Exception {
        try{
            if(driver.findElement(By.name("recurringRequest/recurringRemit/customerAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("recurringRequest/recurringRemit/customerAccount/accountNumber")));
                if(type.equals("KHDN")){
                    accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHDN"));
                }
                else{
                    accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHCN"));
                }
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
            if (bankBranchList.get(i).getText().equals(branch)) {
                bankBranchList.get(i).click();
                Thread.sleep(1000);
            }
        }
        Select feePayerList = new Select(driver.findElement(By.id("tags_charge")));
        feePayerList.selectByVisibleText(feePayer);
        driver.findElement(By.name("recurringRequest/recurringRemit/paymentDetails1")).sendKeys(description);
        driver.findElement(By.name("recurringRequest/recurringRemit/scheduleName")).sendKeys(name);
        Calendar now = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        String s_day = String.valueOf(now.get(Calendar.YEAR));
        String s_month = String.valueOf(now.get(Calendar.MONTH) + 1);
        String s_year = String.valueOf(now.get(Calendar.DAY_OF_MONTH));
        String e_day = String.valueOf(now.get(Calendar.DAY_OF_MONTH) + 1);
        String e_month = String.valueOf(now.get(Calendar.MONTH) + 1);
        String e_year = String.valueOf(now.get(Calendar.YEAR));
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/day")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/day")).sendKeys(s_day);
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/month")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/month")).sendKeys(s_month);
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/year")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/startDate/year")).sendKeys(s_year);
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/day")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/day")).sendKeys(e_day);
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/month")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/month")).sendKeys(e_month);
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/year")).clear();
        driver.findElement(By.name("recurringRequest/recurringRemit/endDate/year")).sendKeys(e_year);
        driver.findElement(By.name("FREQNUM")).clear();
        driver.findElement(By.name("FREQNUM")).sendKeys(freTime);
        driver.findElement(By.name("FREQLIST")).sendKeys(feeMonth);
        Select listNotice = new Select(driver.findElement(By.name("recurringRequest/recurringRemit/notice")));
        listNotice.selectByVisibleText(notice);
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
            Thread.sleep(50000);
    }

    @And("^I get \"([^\"]*)\" fee from above transaction$")
    public void iGetFeeFromTransaction(String name) throws Exception {
            getFeefrom(name);
    }

    @And("^As (KHCN|KHDN), I transfer from \"([^\"]*)\" with \"([^\"]*)\" transaction type, \"([^\"]*)\" number, \"([^\"]*)\" bank, \"([^\"]*)\" amount and \"([^\"]*)\" description$")
    public void iTransferFromWithTransactionTypeCardNumberAmountAndDescription(String user, String fromAccount, String type, String cardNumber, String bank, String amount, String description) throws Exception {
        try{
            if(driver.findElement(By.name("IBFTRequest/IbftObject/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("IBFTRequest/IbftObject/fromAccount/accountNumber")));
                if(user.equals("KHDN")){
                    accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHDN"));
                }
                else{
                    accountList.selectByVisibleText(datamap.get(0).get("fromaccountKHCN"));
                }

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
                driver.findElement(By.id("benBankAuto")).click();
                waitElement(By.id("benBankAuto"));
                driver.findElement(By.id("benBankAuto")).sendKeys(bank);
                Thread.sleep(1000);
                List<WebElement> bankNameList = driver.findElements(By.xpath("//a[@class='ui-corner-all']/div[@class='list_item_container']/div[@class='value']/span"));
                for (int i = 0; i < bankNameList.size(); i++) {
                    System.out.println("bank name list ============   " + bankNameList.get(i).getText());
                    if (bankNameList.get(i).getText().equals(bank)) {
                        bankNameList.get(i).click();
                        Thread.sleep(1000);
                    }
                }
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

    @And("^I get bulk payment of wages fee$")
    public void iGetBulkPaymentOfWagesFee() throws Exception {
        getBulkFee();
    }

    @And("^I get \"([^\"]*)\" transaction total when uploading file$")
    public void iGetTransactionTotalWhenUploadingFile(String name) throws Exception {
        getTransactionNumber(name);
    }

}
