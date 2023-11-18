<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    session.setAttribute("msg", null);
    session.setAttribute("error", null);

    // Check if the POST request contains Rating, Message, and Imgname parameters
    if (request.getMethod().equals("POST")) {
        // Retrieve the values from the POST request
        double rating = Double.parseDouble(request.getParameter("Rating"));
        String message = (String) request.getParameter("Message");
        String imgname = (String) request.getParameter("Imgname");
        System.out.println(rating);
        System.out.println(message);
        System.out.println(imgname);

        // Database connection parameters
        String servername = "localhost";
        String username = "root";
        String password = "super";
        String dbname = "MyProject";

        PreparedStatement stmtSelect = null;
        PreparedStatement stmtUpdate = null;
        Connection conn = null;

        try {
            // Create a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://" + servername + ":3306/" + dbname, username, password);

            // Check the connection
            if (conn == null) {
                throw new SQLException("Connection failed");
            }

            // Retrieve the current reviewsnum for the given imgname
            String sqlSelect = "SELECT reviewsnum, sum FROM products WHERE imgname = ?";
            stmtSelect = conn.prepareStatement(sqlSelect);
            stmtSelect.setString(1, imgname);
            ResultSet resultSelect = stmtSelect.executeQuery();

            if (resultSelect.next()) {
                int reviewsnum = resultSelect.getInt("reviewsnum");
                double sum = resultSelect.getDouble("sum");
                
                reviewsnum++;
                sum += rating;
                double avg = sum / reviewsnum;
                avg = Math.round(avg * 10) / 10.0; // Round to one decimal place

                // Increment the reviewsnum by 1

                // Update the rating and pfeedback in the database
                String sqlUpdate = "UPDATE products SET rating = ?, pfeedback = ?, reviewsnum = ?, sum = ? WHERE imgname = ?";
                stmtUpdate = conn.prepareStatement(sqlUpdate);
                stmtUpdate.setDouble(1, avg);
                stmtUpdate.setString(2, message);
                stmtUpdate.setInt(3, reviewsnum);
                stmtUpdate.setDouble(4, sum);
                stmtUpdate.setString(5, imgname); // Add this line to set the value for the fifth parameter

                int rowsUpdated = stmtUpdate.executeUpdate();

                if (rowsUpdated > 0) {
                    session.setAttribute("msg", "Review Submitted Successfully");
                    response.sendRedirect(request.getContextPath() + "/GetProductServlet?ClickedElem=" + imgname);
                } else {
                    // Error: Data update failed
                    throw new SQLException("Error updating data");
                }
            } else {
                // Error: No record found for the given imgname
                throw new SQLException("No record found for imgname: " + imgname);
            }

        } catch (Exception ex) {
            session.setAttribute("error", ex.getMessage());
            response.sendRedirect(request.getContextPath() + "/GetProductServlet");
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
%>
