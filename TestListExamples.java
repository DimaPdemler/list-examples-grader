import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class TestListExamples {





  @Test
  public void randomtest(){
    List<String> i = new ArrayList<String>();
    List<String> flist = new ArrayList<String>();


    StringChecker wc = new ObjChecker();
    i.add("hi");
    i.add("fish");
    i.add("meats");
    i.add("ree");
    i.add("me");
    // ListExamples.filter(i, wc);
    flist.add("hi");
    flist.add("fish");
    flist.add("me");
    
    assertEquals(flist,ListExamples.filter(i,wc));



    
    // assertEquals(checkString("fish"), checkString("fooood"));
  }
}

class ObjChecker implements StringChecker{

  public boolean checkString(String s){
    if (s.length()%2==0){
      return true;
    }
    else{
      return false;
    }  
  }
}
