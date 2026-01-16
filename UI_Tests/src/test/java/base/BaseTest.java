package base;

ChromeOptions options = new ChromeOptions();

options.addArguments("--headless=new"); // REQUIRED
options.addArguments("--no-sandbox"); // REQUIRED for GitHub runners
options.addArguments("--disable-dev-shm-usage"); // REQUIRED
options.addArguments("--disable-gpu"); // Safe
options.addArguments("--window-size=1920,1080");

WebDriver driver = new ChromeDriver(options);


import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;

public class BaseTest {
    protected WebDriver driver;

    @BeforeMethod
    public void setup() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://example.com"); // demo URL
    }

    @AfterMethod
    public void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}
