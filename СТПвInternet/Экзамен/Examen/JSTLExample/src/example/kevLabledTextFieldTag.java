package example;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class kevLabledTextFieldTag extends TagSupport {
    private String name;
    private String value;
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getValue() {
        return this.value;
    }
    public void setValue(String value) {
        this.value = value;
    }
    public int doStartTag() throws JspException {
        try {
            pageContext.getOut().print("helloWorld");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }

    public int doEndTag(){
        return EVAL_PAGE;
    }
}
