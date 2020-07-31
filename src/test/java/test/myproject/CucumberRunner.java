package test.myproject;

import cucumber.api.CucumberOptions;
import cucumber.api.testng.AbstractTestNGCucumberTests;

@CucumberOptions(
        features = {"src/test/java/test/myproject/KHCN"},
        glue = "test.myproject",
        tags = {"@KHCN_internal_transfer-04"},
        plugin = {
                "html:target/result",
                "pretty",
                "json:target/test-classes/reports/result.json"
        },
        monochrome = true
)

public class CucumberRunner extends  AbstractTestNGCucumberTests{
}
