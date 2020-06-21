package test.myproject.base;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

public class TestBase {
    protected static WebDriver driver;
    protected static Properties prop;
    private File file = new File("config/test.properties");

    public TestBase(){
        try {
            prop = new Properties();
            FileInputStream ip = new FileInputStream(file);
            prop.load(ip);
        } catch (FileNotFoundException e){
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void init(){
        String browserType = prop.getProperty("browser.type");
        switch (browserType.toUpperCase()){
            case "CHROME":
                System.setProperty("webdriver.chrome.driver", "drivers\\chromedriver_2.38.exe");
                driver = new ChromeDriver();
                break;
            case "FIREFOX":
                System.setProperty("webdriver.gecko.driver", "drivers\\geckodriver.exe");
                driver = new FirefoxDriver();
                break;
        }
        driver.manage().window().maximize();
        driver.manage().deleteAllCookies();
        driver.manage().timeouts().pageLoadTimeout(20, TimeUnit.SECONDS);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    }

    public void highLightElement(WebDriver driver, WebElement element) throws Exception{
        JavascriptExecutor js = (JavascriptExecutor) driver;
        js.executeScript("arguments[0].setAttribute('style', 'background: yellow; border: 2px solid red;');", element);
    }

    public void waitElement(By webElement) throws Exception {
        WebDriverWait wait = new WebDriverWait(driver, 300);
        wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(webElement));
        Thread.sleep(1000);
    }

    public void transferType (String type1, String type2) throws Exception{
        waitElement(By.xpath("//li[@class='dropdown group1-G_" + type1 + "']/a[@id='drop4']"));
        driver.findElement(By.xpath("//li[@class='dropdown group1-G_" + type1 + "']/a[@id='drop4']")).click();
        waitElement(By.xpath("//div[@class='dropdown-menu group2-G_" + type1 + "']/div[@class='col_008']/a[@class='link' and contains(text(),'" + type2 + "')]"));
        driver.findElement(By.xpath("//div[@class='dropdown-menu group2-G_" + type1 + "']/div[@class='col_008']/a[@class='link' and contains(text(),'" + type2 + "')]")).click();
        Thread.sleep(2000);
    }
}
