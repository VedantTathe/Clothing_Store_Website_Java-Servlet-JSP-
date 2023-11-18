<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <%@ include file = "components/css/common_css_file.html" %>
        <%@ include file = "components/css/style.html" %>
        <%@ include file = "components/css/responsive_style.html" %>

    </head>
    <body>
        <div>
            <div>
                <%
                    Object mypobj = session.getAttribute("direct_product");
                    if (mypobj != null) {
                        String str = (String) session.getAttribute("direct_product");
                        str = str.trim().toUpperCase();
                        if (str.equals("TRUE")) {
                            response.sendRedirect(request.getContextPath()+"/product_details.jsp");
                        }
                        session.removeAttribute("direct_product");
                        session.setAttribute("direct_product", null);
                    }
                    %>
                <div id="hero-page">
                    <!---------------------------------------Navbar------------------------------------->
                    <%@ include file = "components/navbar.jsp" %>
                    <!---------------------------------------Hero Section------------------------------------->
                    <%@ include file = "components/hero.jsp" %>

                </div>
                <!---------------------------------------Category Section------------------------------------->
                <%@ include file = "components/category.jsp" %>
                <!---------------------------------------Products Section------------------------------------->
                <%@ include file = "components/products.jsp" %>
                <!---------------------------------------Location Section------------------------------------->
                <%@ include file = "components/location.jsp" %>
                <!---------------------------------------Contact Section------------------------------------->
                <%@ include file = "components/contact.jsp" %>
                <!---------------------------------------Footer Section------------------------------------->
                <%@ include file = "components/footer.jsp" %>

            </div>
        </div>
        <%@ include file = "components/js/javascript.html" %>
        
    </body>
</html>
