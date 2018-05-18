import io.restassured.RestAssured;
import org.json.JSONException;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.notNullValue;

public class RestAssuredTest {
    private static String SERVLET_URL = "http://localhost:8080/simpleServlet";
    @BeforeMethod
    public void setUp(){
        RestAssured.post(SERVLET_URL + "?value=element");
    }
    @Test(description = "GET")
    public void getRequestTest() throws JSONException {
        RestAssured.get(SERVLET_URL + "?value=0")
                .then()
                    .statusCode(200)
                .assertThat()
                    .body("value", notNullValue());
    }

    @Test(description = "POST")
    public void postRequestTest() throws JSONException {
        RestAssured.post(SERVLET_URL + "?value=element")
                .then()
                    .statusCode(200)
                .assertThat()
                    .body("value", equalTo("element"));
    }

    @Test(description = "PUT")
    public void putRequestTest() throws JSONException {
        RestAssured.put(SERVLET_URL + "?value=anotherElement")
                .then()
                    .statusCode(200)
                .assertThat()
                    .body("value", notNullValue());
    }

    @Test(description = "DELETE")
    public void deleteRequestTest() throws JSONException {
        RestAssured.delete(SERVLET_URL + "?value=0")
                .then()
                    .statusCode(200)
                .assertThat()
                    .body("value", notNullValue());
    }
}