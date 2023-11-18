<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<div id="category" style="background-color: #e9e9e9;">
    
    <h1 class="container m-auto pb-4" style="width: fit-content;">Category</h1>
    <div id="cat" class="container ps-3 pe-3 pb-3">

        <%
            try {
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyProject", "root", "super");
                String sql = "select * from category";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String imgname = rs.getString(4);
                    String path = "components/images/category" + "/" + imgname;
        %>
        <a onclick="checkCat('<%=rs.getString("cname")%>')"  style="text-decoration:  none;">
            <div class="btn mybtn categ" style="color: black; border: 1px solid #e9e9e9;background-color: #e9e9e9">
                <img src="<%=path%>" alt="<%=imgname%>">

                <h6><%=rs.getString("cname")%></h6>
            </div>
        </a>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception ex) {
                System.out.println(ex);
            }
        %>
    </div>
</div>