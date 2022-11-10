import static org.junit.Assert.*;
import org.junit.*;

public class TestListExamples {




  public boolean checkString(String string1){
    if (string1.length()%2==0){
      return true;
    }
    else{
      return false;
    }
  }
  @Test
  public void randomtest(){
    // assertEquals(checkString("fish"), checkString("fooood"));
  }
}
