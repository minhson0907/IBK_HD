package test.myproject.stepdefinition;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import test.myproject.base.TestBase;
import test.myproject.utils.DataHelper;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

public class adminSteps extends TestBase {
     private double before_limit = 0;
     private double after_limit = 0;

    public List<HashMap<String,String>> datamap;
    public adminSteps()
    {
        datamap = DataHelper.data(System.getProperty("user.dir")+"//data//userdata.xlsx","Sheet1");
    }

    @Then("^As (KHCN|KHDN), I search the limit with user \"([^\"]*)\"$")
    public void iSearchTheLimitWithUser(String type, String name) throws Exception {
        waitElement(By.xpath("//td[@id='leftmenu']//div[@class='menushow' and @title='Quản lý thông tin khách hàng']/a[@onclick='toggle(\"QLKHTH\"); return false;']"));
        driver.findElement(By.xpath("//td[@id='leftmenu']//div[@class='menushow' and @title='Quản lý thông tin khách hàng']/a[@onclick='toggle(\"QLKHTH\"); return false;']")).click();
        waitElement(By.xpath("//td[@id='leftmenu']//div[@class='menuhide' and @title='Cập nhật hạn mức']/a[@onclick='runJob(\"EMC031\",\"eFinCommon\",\"SERV\",\"MAIN\"); return false;']"));
        driver.findElement(By.xpath("//td[@id='leftmenu']//div[@class='menuhide' and @title='Cập nhật hạn mức']/a[@onclick='runJob(\"EMC031\",\"eFinCommon\",\"SERV\",\"MAIN\"); return false;']")).click();
        waitElement(By.name("arm/limit/def1"));
        if(type.equals("KHCN")){
            driver.findElement(By.name("arm/limit/def1")).sendKeys(datamap.get(0).get("userKHCN"));
        }
        else{
            driver.findElement(By.name("arm/limit/def1")).sendKeys(datamap.get(0).get("userKHDN"));
        }
        driver.findElement(By.xpath("//input[@class='btn btn-warning' and @value='Tìm kiếm']")).click();
    }

    private double getLimitBefore (String name) throws Exception{
        WebElement elemLimit= driver.findElement(By.xpath("//table[@class='tableTemp']//tr[td[contains(text(),'" + name + "')]]/td[6]"));
        String limit=elemLimit.getText();
        limit=limit.replace(",","");
        limit=limit.replace(" VND","");
        System.out.println("==================== before limit " + limit);
        double before_limit = Double.parseDouble(limit);
        return before_limit;
    }

    @And("^I get before transferring limit \"([^\"]*)\" with above user$")
    public void iGetBeforeTransferringLimit(String transferType) throws Exception {
        before_limit = getLimitBefore(transferType);
    }

    private double getLimitAfter (String name) throws Exception{
        WebElement elemLimit= driver.findElement(By.xpath("//table[@class='tableTemp']//tr[td[contains(text(),'" + name + "')]]/td[6]"));
        String limit=elemLimit.getText();
        limit=limit.replace(",","");
        limit=limit.replace(" VND","");
        System.out.println("==================== after amount " + limit);
        double after_limit = Double.parseDouble(limit);
        return after_limit;
    }

    @And("^I get after transferring limit \"([^\"]*)\" with above user$")
    public void iGetAfterTransferringLimit(String transferType) throws Exception {
        after_limit = getLimitAfter(transferType);
    }

    @And("^As (KHCN|KHDN), I choose \"([^\"]*)\" account, \"([^\"]*)\" ID account and \"([^\"]*)\" authenticate method$")
    public void iChooseAccountIDAccountAndAuthenticateMethod(String type, String account, String accountId, String authenticateMethod) throws Exception {
        if(type.equals("KHCN")){
            waitElement(By.name("slb_acct"));
            Select listAccount =new Select(driver.findElement(By.name("slb_acct")));
            listAccount.selectByVisibleText(datamap.get(0).get("fromaccountKHCN"));
            waitElement(By.name("slb_user"));
            Select listAccountId =new Select(driver.findElement(By.name("slb_user")));
            listAccountId.selectByVisibleText(datamap.get(0).get("userKHCN"));
            Select listAuthenticateMethod =new Select(driver.findElement(By.name("slb_token")));
            listAuthenticateMethod.selectByVisibleText(datamap.get(0).get("authKHCN"));
        }
        else {
            waitElement(By.name("slb_acct"));
            Select listAccount =new Select(driver.findElement(By.name("slb_acct")));
            listAccount.selectByVisibleText(datamap.get(0).get("fromaccountKHDN"));
            waitElement(By.name("slb_user"));
            Select listAccountId =new Select(driver.findElement(By.name("slb_user")));
            listAccountId.selectByVisibleText(datamap.get(0).get("userKHDN"));
            Select listAuthenticateMethod =new Select(driver.findElement(By.name("slb_token")));
            listAuthenticateMethod.selectByVisibleText(datamap.get(0).get("authKHDN"));
        }
    }

    @Then("^I verify after transferring limit = before transferring limit - \"([^\"]*)\"$")
    public void iVerifyAfterTransferringLimitBeforeTransferringLimit(String number) throws Exception {
        double d_number = Double.parseDouble(number);
        DecimalFormat decimalFormat = new DecimalFormat("##0000");
        String s_after_limit = decimalFormat.format(after_limit);
        String s_before_limit = decimalFormat.format(before_limit);
        System.out.println("=============== after limit " + s_after_limit);
        System.out.println("=============== before limit " + s_before_limit);
        System.out.println("=============== number " + number);
        assertEquals(after_limit,before_limit - d_number);
    }

    @And("^I edit limit amount (per transaction|per day) to \"([^\"]*)\" for \"([^\"]*)\"$")
    public void iEditLimitAmountPerTransactionToFor(String limitType, String amount, String transferType) throws Exception {
       if (limitType.equals("per transaction") && transferType.equals("Chuyển tiền trong khác chủ TK")){
           driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).clear();
           driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).sendKeys(amount);
        }
       else if (limitType.equals("per day") && transferType.equals("Chuyển tiền trong khác chủ TK")){
           driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).clear();
           driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).sendKeys(amount);
       }
        if (limitType.equals("per transaction") && transferType.equals("Chuyển tiền ngoài hệ thống")){
            driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).clear();
            driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).sendKeys(amount);
        }
        else if (limitType.equals("per day") && transferType.equals("Chuyển tiền ngoài hệ thống")){
            driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).clear();
            driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).sendKeys(amount);
        }
    }

    @Then("^I approve the above request$")
    public void iApproveTheAboveRequest() throws Exception{
        waitElement(By.xpath("//td[@id='leftmenu']//div[@class='menushow' and @title='Quản lý thông tin khách hàng']/a[@onclick='toggle(\"QLKHTH\"); return false;']"));
        driver.findElement(By.xpath("//td[@id='leftmenu']//div[@class='menushow' and @title='Quản lý thông tin khách hàng']/a[@onclick='toggle(\"QLKHTH\"); return false;']")).click();
        waitElement(By.xpath("//td[@id='leftmenu']//div[@class='menuhide' and @title='Duyệt yêu cầu']/a[@onclick='runJob(\"EMC033\",\"eFinCommon\",\"SERV\",\"MAIN\"); return false;']"));
        driver.findElement(By.xpath("//td[@id='leftmenu']//div[@class='menuhide' and @title='Duyệt yêu cầu']/a[@onclick='runJob(\"EMC033\",\"eFinCommon\",\"SERV\",\"MAIN\"); return false;']")).click();
        driver.findElement(By.xpath("//table[@class='tableTemp']//tr[2]/td[6]/a")).click();
        waitElement(By.xpath("//input[@type='password']"));
        driver.findElement(By.xpath("//input[@type='password']")).clear();
        driver.findElement(By.xpath("//input[@type='password']")).sendKeys("123456");
        driver.findElement(By.xpath("//a[@onclick='return doApprove(document.forms[0]);']")).click();
    }

    @And("^I transfer from \"([^\"]*)\" to \"([^\"]*)\" account with \"([^\"]*)\"$")
    public void iTransferFromToAccountWithBeforeRemainingLimitTotal(String fromAccount, String toAccount, String type) throws Exception {
        try{
            if(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("ftRequest/fundsTransfer/toAccount/accountNumber")).sendKeys(toAccount);
        DecimalFormat decimalFormat = new DecimalFormat("##0000");
        switch (type){
            case "before remaining limit total":
                String s_before_limit = decimalFormat.format(before_limit);
                System.out.println("before remaining limit total-------------" + s_before_limit);
                driver.findElement(By.name("ftRequest/fundsTransfer/transferAmountFormat")).clear();
                driver.findElement(By.name("ftRequest/fundsTransfer/transferAmountFormat")).sendKeys(s_before_limit);
                break;
            case "before remaining limit total + 1":
                String s_over_limit = decimalFormat.format(before_limit + 1);
                driver.findElement(By.name("ftRequest/fundsTransfer/transferAmountFormat")).sendKeys(s_over_limit);
                break;
        }
        Select feePayerList = new Select(driver.findElement(By.id("tags_charge")));
        feePayerList.selectByVisibleText("Bên chuyển");
        driver.findElement(By.name("ftRequest/fundsTransfer/remarks")).sendKeys("AUTO DESCRIPTION");
        driver.findElement(By.xpath("//a[@class='btn btn-warning' and contains(text(),'Tiếp Tục')]")).click();
    }

    @And("^I edit limit amount (per day|per transaction) over remaining limit for \"([^\"]*)\"$")
    public void iEditLimitAmountPerDayOverRemainingLimitFor(String limitType, String transferType) throws Exception {
          if(limitType.equals("per transaction") && transferType.equals("Chuyển tiền trong khác chủ TK")){
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).clear();
              double per_transaction_limit = before_limit + 1;
              DecimalFormat decimalFormat = new DecimalFormat("##0000");
              String s_per_transaction_limit = decimalFormat.format(per_transaction_limit);
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).sendKeys(s_per_transaction_limit);
              Thread.sleep(2000);
        }
          else if(limitType.equals("per day") && transferType.equals("Chuyển tiền trong khác chủ TK")){
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).clear();
              double per_day_limit = before_limit + 2;
              DecimalFormat decimalFormat = new DecimalFormat("##0000");
              String s_per_day_limit = decimalFormat.format(per_day_limit);
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).sendKeys(s_per_day_limit);
              Thread.sleep(2000);
        }
          else if(limitType.equals("per transaction") && transferType.equals("Chuyển tiền ngoài hệ thống")){
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).clear();
              double per_transaction_limit = before_limit + 1;
              DecimalFormat decimalFormat = new DecimalFormat("##0000");
              String s_per_transaction_limit = decimalFormat.format(per_transaction_limit);
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[2]/input")).sendKeys(s_per_transaction_limit);
              Thread.sleep(2000);
          }
          else if(limitType.equals("per day") && transferType.equals("Chuyển tiền ngoài hệ thống")){
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).clear();
              double per_day_limit = before_limit + 2;
              DecimalFormat decimalFormat = new DecimalFormat("##0000");
              String s_per_day_limit = decimalFormat.format(per_day_limit);
              driver.findElement(By.xpath("//table[@id='tb-acct-limit']//tr[td[contains(text(),'"+ transferType +"')]]/td[4]/input")).sendKeys(s_per_day_limit);
              Thread.sleep(2000);
          }
    }

    @Then("^I update the above request$")
    public void iUpdateTheAboveRequest() throws Exception{
        driver.findElement(By.xpath("//a[@onclick='return doUpdate();']")).click();
        Thread.sleep(3000);
    }

    @And("^I transfer from \"([^\"]*)\" with \"([^\"]*)\" to \"([^\"]*)\" account number, \"([^\"]*)\" account name, \"([^\"]*)\" bank name, \"([^\"]*)\" city, \"([^\"]*)\" branch, \"([^\"]*)\" fee payer and \"([^\"]*)\" description$")
    public void iTransferFromWithBeforeRemainingLimitTotalToAccountNumberAccountNameBankNameCityBranchFeePayerAndDescription(String fromAccount, String type, String accountNumber, String accountName, String bankName, String city, String branch, String feePayer, String description) throws Exception {
        try{
            if(driver.findElement(By.name("remittanceRequest/remittance/customerAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("remittanceRequest/remittance/customerAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        DecimalFormat decimalFormat = new DecimalFormat("##0000");
        switch (type){
            case "before remaining limit total":
                String s_before_limit = decimalFormat.format(before_limit);
                driver.findElement(By.id("id_tempBenAmountFormat")).sendKeys(s_before_limit);
                break;
            case "before remaining limit total + 1":
                String s_over_limit = decimalFormat.format(before_limit + 1);
                driver.findElement(By.id("id_tempBenAmountFormat")).sendKeys(s_over_limit);
                break;
        }
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

    @Then("^I transfer from \"([^\"]*)\" with \"([^\"]*)\" and \"([^\"]*)\" name, \"([^\"]*)\" Identification type, \"([^\"]*)\" ID/PASSPORT, \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" Date of issuance, \"([^\"]*)\" Place of issuance, \"([^\"]*)\" fee charged and \"([^\"]*)\" description$")
    public void iTransferFromWithBeforeRemainingLimitTotalNameIdentificationTypeIDPASSPORTDateOfIssuancePlaceOfIssuanceFeeChargedAndDescription(String fromAccount, String amount, String name, String type, String id, String day, String month, String year, String place, String fee, String description) throws Exception {
        try {
            if (driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")).isEnabled()) {
                Select accountList = new Select(driver.findElement(By.name("BulkCMNDRequest/bulkCMND/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        DecimalFormat decimalFormat = new DecimalFormat("##0000");
        switch (amount){
            case "before remaining limit total":
                String s_before_limit = decimalFormat.format(before_limit);
                driver.findElement(By.id("kkkkkout")).sendKeys(s_before_limit);
                break;
            case "before remaining limit total + 1":
                String s_over_limit = decimalFormat.format(before_limit + 1);
                driver.findElement(By.id("kkkkkout")).sendKeys(s_over_limit);
                break;
        }
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

}
