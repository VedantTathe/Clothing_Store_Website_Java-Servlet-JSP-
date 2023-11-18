<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


        <link rel="stylesheet" href="components/css/style.css">
        <link rel="stylesheet" href="components/css/responsive_css.css">

        <style>
            .alert h3 {
                font-size: 1.2rem;
                width: fit-content;
                margin: auto;
            }
            nav li{
                cursor: pointer;
            }

            nav a{
                text-decoration: none;
                color: #ffffff8c;
            }
        </style>

    </head>

    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8  position-relative ">
                    <h1 class="text-center">Product Search</h1>
                    <div class="input-group " style="    display: flex;
                         justify-content: center;
                         align-items: center;">
                        <input type="text" id="searchInput" class="form-control" placeholder="Search for products">
                        <div class="input-group-append">
                            <button class="btn btn-primary" id="searchButton" type="button">Search</button>
                        </div>
                    </div>
                    <div id="searchResults" class="mt-3 position-relative ">
                        <!-- Search results will be displayed here -->
                    </div>


                    
                </div>
            </div>
        </div>

        <script>
            
            
            $(document).ready(function () {
                // When the search button is clicked
                $("#searchButton").click(function () {
                    // Get the search query from the input field
                    var query = $("#searchInput").val();

                    // Perform an AJAX request to retrieve data
                    $.ajax({
                        url: "<%=request.getContextPath()%>/components/getsearch.jsp", // Replace with the actual backend URL
                        method: "POST",
                        data: {query: query},
                        success: function (data) {
                            // Display the search results in the designated div
                            $("#searchResults").html(data);
                            console.log("success");
                        },
                        error: function (xhr, status, error) {
                            // Handle errors here
                            console.error(error);
                        }
                    });
                });
            });
            
        </script>



        <script src="components/js/index.js"></script>

    </body>

</html>