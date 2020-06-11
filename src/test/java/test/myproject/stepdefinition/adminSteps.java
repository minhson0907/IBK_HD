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

import java.text.DecimalFormat;
import java.util.List;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

public class adminSteps extends TestBase {
     private double before_limit = 0;
     private double after_limit = 0;

    @Then("^I search the limit with user \"([^\"]*)\"$")
    public void iSearchTheLimitWithUser(String name) throws Exception {
        waitElement(By.xpath("//td[@id='leftmenu']//div[@class='menushow' and @title='Quản lý thông tin khách hàng']/a[@onclick='toggle(\"QLKHTH\"); return false;']"));
        driver.findElement(By.xpath("//td[@id='leftmenu']//div[@class='menushow' and @title='Quản lý thông tin khách hàng']/a[@onclick='toggle(\"QLKHTH\"); return false;']")).click();
        waitElement(By.xpath("//td[@id='leftmenu']//div[@class='menuhide' and @title='Cập nhật hạn mức']/a[@onclick='runJob(\"EMC031\",\"eFinCommon\",\"SERV\",\"MAIN\"); return false;']"));
        driver.findElement(By.xpath("//td[@id='leftmenu']//div[@class='menuhide' and @title='Cập nhật hạn mức']/a[@onclick='runJob(\"EMC031\",\"eFinCommon\",\"SERV\",\"MAIN\"); return false;']")).click();
        waitElement(By.name("arm/limit/def1"));
        driver.findElement(By.name("arm/limit/def1")).sendKeys(name);
        driver.findElement(By.xpath("//input[@class='btn btn-warning' and @value='Tìm kiếm']")).click();
    }

    private double getLimitBefore (String name) throws Exception{
        WebElement elemLimit= driver.findElement(By.xpath("//table[@class='tableTemp']//tr[td[contains(text(),'" + name + "')]]/td[6]"));
        String limit=elemLimit.getText();
        limit=limit.replace(",","");
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
        System.out.println("==================== after amount " + limit);
        double after_limit = Double.parseDouble(limit);
        return after_limit;
    }

    @And("^I get after transferring limit \"([^\"]*)\" with above user$")
    public void iGetAfterTransferringLimit(String transferType) throws Exception {
        after_limit = getLimitAfter(transferType);
    }

    @And("^I choose \"([^\"]*)\" account, \"([^\"]*)\" ID account and \"([^\"]*)\" authenticate method$")
    public void iChooseAccountIDAccountAndAuthenticateMethod(String account, String accountId, String authenticateMethod) throws Exception {
        waitElement(By.name("slb_acct"));
        Select listAccount =new Select(driver.findElement(By.name("slb_acct")));
        listAccount.selectByVisibleText(account);
        waitElement(By.name("slb_user"));
        Select listAccountId =new Select(driver.findElement(By.name("slb_user")));
        listAccountId.selectByVisibleText(accountId);
        Select listAuthenticateMethod =new Select(driver.findElement(By.name("slb_token")));
        listAuthenticateMethod.selectByVisibleText(authenticateMethod);
    }

    @Then("^I verify after transferring limit = before transferring limit - \"([^\"]*)\"$")
    public void iVerifyAfterTransferringLimitBeforeTransferringLimit(String number) throws Exception {
        double d_number = Double.parseDouble(number);
        System.out.println("=============== after limit " + after_limit);
        System.out.println("=============== before limit " + before_limit);
        System.out.println("=============== number " + d_number);
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

    @And("^I transfer from \"([^\"]*)\" to \"([^\"]*)\" account with before remaining limit total$")
    public void iTransferFromToAccountWithBeforeRemainingLimitTotal(String fromAccount, String toAccount) throws Exception {
        try{
            if(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")));
                accountList.selectByVisibleText(fromAccount);
            }
        }
        catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        driver.findElement(By.name("ftRequest/fundsTransfer/toAccount/accountNumber")).sendKeys(toAccount);
        DecimalFormat decimalFormat = new DecimalFormat("##0000");
        String s_before_limit = decimalFormat.format(before_limit);
        driver.findElement(By.name("ftRequest/fundsTransfer/transferAmountFormat")).sendKeys(s_before_limit);
        Select feePayerList = new Select(driver.findElement(By.id("tags_charge")));
        feePayerList.selectByVisibleText("Bên nhận");
        driver.findElement(By.name("ftRequest/fundsTransfer/remarks")).sendKeys("AUTO DESCRIPTION");
        driver.findElement(By.xpath("//a[@onclick='return doSubmit(myform);' and contains(text(),'Tiếp Tục')]")).click();
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
    }

    @Then("^I update the above request$")
    public void iUpdateTheAboveRequest() throws Exception{
        driver.findElement(By.xpath("//a[@onclick='return doUpdate();']")).click();
        Thread.sleep(3000);
    }
}
