package tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.List;

public class Table extends TagSupport {
    private List<Object> list;
    private int size;

    public void setList(List<Object> list) {
        this.list = list;
    }

    public void setSize(int size) {
        this.size = size;
    }
    @Override
    public int doStartTag() throws JspException {

        JspWriter out=pageContext.getOut();
        try {
            out.print("<table>");
            out.print("<tr>");
           for(int i = 0 ; i < list.size() || i<size ; i++){
               out.print("<td>"+list.get(i)+"</td>");
           }
            out.print("</tr>");
            out.print("</table>");

        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}
