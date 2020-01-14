<%@page buffer="5" autoFlush="true" session="false"%>
<%@page language="java" import="java.util.*, javax.naming.*,
  javax.naming.directory.*, java.net.*"%>
<%@ page import="static javax.swing.text.html.CSS.getAttribute" %>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    //response.setHeader("Expires", "Thu, 29 Oct 1969 17:04:19 GMT");

// check if authentication was successful
    if ("SUCCESS".equals(request.getAttribute("oracle.security.fed.authn.result.statuscode")))
    {
        // authentication was successful. Attributes will be added
        //oracle.security.fed.authn.fedattributes
        Map attrMap = (Map) request.getAttribute("oracle.security.fed.authn.fedattributes");
        System.out.println("GWFSAMLUPDATER");
        System.out.println(attrMap.keySet());
        Set<String> keys = attrMap.keySet();
        for(String key: keys){
            System.out.println(attrMap.get(key).getClass() + ":::" + attrMap.get(key));
        }

    }

// forward to the OIF server to resume the flow
    request.getSession().getServletContext().getContext("/oamfed").getRequestDispatcher("/user/loginsso").forward(request, response);
%>