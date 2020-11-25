package tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class Label extends TagSupport {
    private String name;
    private String label;
    private String value;

    public void setName(String name) {
        this.name = name;
    }

    public void setLabel(String label) {
        this.label = label;

    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public int doStartTag() throws JspException {
        JspWriter out=pageContext.getOut();
        try {
            out.print("<input type = text name = "+name+" value = "+value+">");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}
