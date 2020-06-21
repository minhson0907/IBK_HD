package test.myproject;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        features = {"src/test/java/test/myproject/KHDN"},
        glue = "test.myproject",
        tags = {"@KHDN_schedule_fund_transfer-01"},
        plugin = {
                "html:target/result",
                "pretty",
                "json:target/test-classes/reports/result.json"
        },
        monochrome = true
)

public class CucumberRunner extends  AbstractTestNGCucumberTests{
}
