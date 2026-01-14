package tests;

import base.BaseTest;
import org.testng.Assert;
import org.testng.annotations.Test;
import pages.LoginPage;

public class LoginTest extends BaseTest {

    @Test
    public void sampleTest() {
        LoginPage login = new LoginPage(driver);
        login.login("user", "pass");
        Assert.assertTrue(driver.getTitle() != null);
    }
}
