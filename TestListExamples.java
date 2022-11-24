import static org.junit.Assert.*;
import org.junit.*;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;

public class TestListExamples {
  



  @Test
  public void filterCorrectly() {
    List<String> i = new ArrayList<String>();
    List<String> endList = new ArrayList<String>();
    i.add("1Hello");
    i.add("We");
    i.add("1Are2");
    i.add("Here");
    StringChecker wc = new ObjChecker();
    ListExamples.filter(i, wc);
    endList.add("1Hello");
    endList.add("We");
    endList.add("Here");
    assertEquals(endList,ListExamples.filter(i,wc));
  }

  @Test
  public void lengthtest(){
    List<String> list1 = new ArrayList<String>();
      List<String> list2 = new ArrayList<String>();
      list1.add("food1");
      list1.add("foo2");
      list1.add("food3");
      list1.add("foo4");
      list1.add("food5");
      list1.add("food6");

      StringChecker wc2 = new ObjChecker();
     
      
     
      // List<String> list3 = ListExamples.merge(list1, list2);
      
      assertEquals(2,  ListExamples.filter(list1, wc2).size());
  }
 





  // Write your grading tests here!
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
