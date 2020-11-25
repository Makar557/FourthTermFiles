package Tags;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

public class Pasport extends TagSupport  {
    private String myPasport;

    public void setMyPasport(String myPasport) {
        this.myPasport = myPasport;
    }

    public int doStartTag() throws JspException {
        try {
            //Выводим паспорт на my.jsp
            pageContext.getOut().println(this.myPasport);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SKIP_BODY;
    }
}
