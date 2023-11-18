<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    if (request.getMethod().equals("POST")) {

        // Check if the query parameter is set
        if (request.getParameter("query") != null) {
            String searchQuery = request.getParameter("query");
//            out.println(searchQuery);
            String username = "root";
            String password = "super";

            Connection conn = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish the connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject", username, password);

                // SQL query to search for products
                String sql = "SELECT * FROM products WHERE pname LIKE '%" + searchQuery + "%' OR pcat LIKE '%" + searchQuery + "%'";

                // Execute the query
                Statement stmt = conn.createStatement();
                ResultSet result = stmt.executeQuery(sql);

                // Display search results
                if (result.next()) {
                    do {
                        String imgName = result.getString("imgname");
                        String path = "components/images/products" + "/" + imgName;
%>
                        <div class="searched_products d-flex justify-content-center align-items-center card overflow-hidden" style="width:100%; height:min-content;">
                            <a onclick="call('<%= imgName %>')" class="<%= result.getString("pcat") %> dynamic-product ALL "  style="text-decoration:  none; ">
                                <div class="btn product" style=" width:100%;" >

                                    <div class="" style="border: none;">
                                        <div class="card-body d-flex  align-items-center" style="width:100%;">
                                            <img src="<%= path %>" alt="<%= imgName %>" style="height:7rem">

                                            <p class="ellipsis p-1"><%= result.getString("pname") %></p>
                                           
                                            <div class="price pt-1">
                                                <strong>&#8377;<%= result.getString("price") %></strong>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
<%
                    } while (result.next());
                } else {
                    out.println("<p>No results found</p>");
                }

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } finally {
                // Close the database connection
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
%>

<form action="<%=request.getContextPath()%>/GetProductServlet" method="get" id="hidden_form" class="">
                        <input type="text" id="clicked_elem" name="ClickedElem" value="" class="" />
                    </form>
<script>
    
    function call(elem)
    {
        document.getElementById("clicked_elem").value = elem;
        document.getElementById("hidden_form").submit();
    }
    
    
</script>