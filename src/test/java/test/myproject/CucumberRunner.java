package test.myproject;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        features = {"src/test/java/test/myproject/EOCD2/KHDN"},
        glue = "test.myproject",
        tags = {"@KHDN_bulk_payment_of_wages-00"},
        plugin = {
                "html:target/result",
                "pretty",
                "json:target/test-classes/reports/result.json"
        },
        monochrome = true
)

public class CucumberRunner extends  AbstractTestNGCucumberTests{
}
