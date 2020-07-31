package test.myproject.stepdefinition;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.Select;
import test.myproject.base.TestBase;
import test.myproject.utils.DataHelper;

import java.util.HashMap;
import java.util.List;

public class ibkGroupSteps extends TestBase {

    public List<HashMap<String,String>> datamap_group;
    public ibkGroupSteps()
    {
        datamap_group = DataHelper.data(System.getProperty("user.dir")+"//data//userdata_group.xlsx","Sheet1");
    }

    @Then("^As the (first|second) approval user in (multi|cross) group, I login KHDN with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void loginKHDN(String order, String group,String userName, String passWord) throws Exception {
        driver.switchTo().frame("main").switchTo().frame("tran");
        //Close Popup
//        try{
//            if(driver.findElement(By.xpath("//a[@class='btn btn-warning']")).isEnabled()){
//                driver.findElement(By.xpath("//a[@class='btn btn-warning']")).click();
//            }
//        }catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        // Change tab to KHDN
        driver.findElement(By.id("tab-corp")).click();
        if (order.equals("first") && group.equals("multi")){
            driver.findElement(By.id("txtUserName")).clear();
            driver.findElement(By.id("txtUserName")).sendKeys(datamap_group.get(0).get("userKHDNduyet1"));
        }
        else if (order.equals("second") && group.equals("multi")){
            driver.findElement(By.id("txtUserName")).clear();
            driver.findElement(By.id("txtUserName")).sendKeys(datamap_group.get(0).get("userKHDNduyet2"));
        }
        driver.findElement(By.id("txtPassKey")).clear();
        driver.findElement(By.id("txtPassKey")).sendKeys(datamap_group.get(0).get("password"));
        driver.findElement(By.id("Login")).click();
    }

    @When("^As an input user in group, I login KHDN with \"([^\"]*)\" and \"([^\"]*)\"$")
    public void asAnInputUserInGroupILoginKHDNWithAnd(String user, String pass) throws Exception {
        driver.switchTo().frame("main").switchTo().frame("tran");
        //Close Popup
//        try{
//            if(driver.findElement(By.xpath("//a[@class='btn btn-warning']")).isEnabled()){
//                driver.findElement(By.xpath("//a[@class='btn btn-warning']")).click();
//            }
//        }catch (Exception e){System.out.println("Error:  " + e.getMessage());}
        // Change tab to KHDN
        driver.findElement(By.id("tab-corp")).click();
        driver.findElement(By.id("txtUserName")).clear();
        driver.findElement(By.id("txtUserName")).sendKeys(datamap_group.get(0).get("userKHDNnhap"));
        driver.findElement(By.id("txtPassKey")).clear();
        driver.findElement(By.id("txtPassKey")).sendKeys(datamap_group.get(0).get("password"));
        driver.findElement(By.id("Login")).click();
    }

    @And("^As KHDN in group, I transfer from \"([^\"]*)\" to \"([^\"]*)\" account, \"([^\"]*)\" amount and \"([^\"]*)\" description with fee payer is \"([^\"]*)\"$")
    public void asKHDNInMultiGroupITransferFromToAccountAmountAndDescriptionWithFeePayerIs(String fromAccount, String toAccount,String amount, String description, String feePayer) throws Exception {
        try{
            if(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")).isEnabled()){
                Select accountList = new Select(driver.findElement(By.name("ftRequest/fundsTransfer/fromAccount/accountNumber")));
                    accountList.selectByVisibleText(datamap_group.get(0).get("fromaccountKHDN"));
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

    @And("^As KHDN in group, I choose \"([^\"]*)\" account$")
    public void asKHDNInGroupIChooseAccount(String arg0) throws Throwable {
        try{
            if(driver.findElement(By.name("ACCOUNTNO")).isEnabled()){
                Select listAccount =new Select(driver.findElement(By.name("ACCOUNTNO")));
                listAccount.selectByVisibleText(datamap_group.get(0).get("fromaccountKHDN"));
                driver.findElement(By.id("kkkkkout")).click();
            }
        }
        catch (Exception e){System.out.println("Error message: " + e.getMessage());}
    }
}
