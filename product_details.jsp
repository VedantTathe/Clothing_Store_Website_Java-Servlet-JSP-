<%@page import="java.io.File"%>
<%@page import="Bean.Product"%>
<%@page import="Bean.User"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product</title>
        <%@ include file = "components/css/common_css_file.html" %>
        
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html,
        body {
            height: 100%;
            width: 100%;
        }

        .alert h3 {
            font-size: 1.2rem;
            width: fit-content;
            margin: auto;
        }

        nav li {
            cursor: pointer;
        }

        nav a {
            text-decoration: none;
            color: #ffffff8c;
        }

        .review {
            font-size: 1rem;
            background-color: #00ab00;
            width: fit-content;
            padding: 1px 5px;
            border-radius: 5px;
            margin: 0 5px 0 0;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 5px;
            flex-wrap: nowrap;

        }

        #product-img {
            transition: 0.5s;
            width: 25rem;
        }

        #product-img:hover {
            transform: scale(1.1);
        }

        .mybox {
            flex-direction: column;
        }

        .mybtn {
            color: white;
            border: 1px solid white;
            transition: all ease 0.5s;
            width: 10rem;
        }

        .mybtn:hover {
            background-color: white;
            color: white;
            border: 1px solid black;
            transform: translateY(-5px);
        }

        .col1 {
            padding-bottom: 0;
        }

        .col2 {
            padding: 20px;
        }

        .mybtn-nav {

            color: white;
            border: 1px solid white;
            transition: all ease 0.5s;
            padding: 3.5px;
            margin: 4px 5px;

            width: 5rem;
        }

        .mybtn-nav a {

            color: #ffffffbf;
            text-decoration: none;
        }

        .mybtn:disabled {
            color: white;
            background-color: #777777;
            border: 1px solid white;
        }

        .mybtn {
            color: white;
            border: 1px solid white;
            transition: all ease 0.5s;
            /* background-color: #323232bf; */
            background-color: #525252;
        }

        .mybtn:hover {
            background-color: white;
            color: black;
            border: 1px solid black;
        }

        input {
            margin: 10px 0;

        }

        .mybtn:hover {
            transform: translateY(-5px);
        }

        /* menu-page */

        /* .menu {
                width: 40%;
                overflow: hidden;
            } */

        .menu img {
            padding: 15px;
        }

        .menu h4 {
            width: fit-content;
            margin: auto;
            padding: 5px;
        }

        .box {
            width: 50%;
        }

        .card:hover {
            box-shadow: 14px 7px 25px -2px rgb(108, 108, 108);
            background-color: #aaaaaa;
        }

        td,
        th {
            text-wrap: nowrap;
            padding: 1px 2px;
        }

        .stars {
            display: inline-block;
        }

        .star {
            cursor: pointer;
            font-size: 24px;
            color: gray;
        }

        .star:hover {
            color: orange;
        }

        @media only screen and (max-width: 768px) {
            .box {
                width: 80%;
            }
        }

        @media only screen and (max-width: 996px) {
            .modal {
                height: 80vmax;
            }
        }

        @media only screen and (min-width: 992px) {
            .col2 {
                overflow-y: scroll;
                height: 92vh;
            }

            .col1 {
                height: 92vh;
                border-right: 2px solid grey;
            }

            body {
                overflow: hidden;
            }

            .mybox {
                flex-direction: row;
            }

            .col2 {
                padding: 40px;
            }

        }

        @media only screen and (max-width: 570px) {
            #product-img {
                width: 16rem;
            }

            .mybtn {

                width: 6.5rem;
                font-size: 0.7rem;
            }
        }
    </style>

    </head>

    <body>

        <%
            Object pr = session.getAttribute("product");
            if (pr != null) {
                Product product = (Product) session.getAttribute("product");

                String FName = "Your Full Name", Email = "Your Email", MNumber = "Your Mobile Number", Address = "Your Address";

                Object mynnuser = session.getAttribute("user");

                if (mynnuser != null) {
                    User contact_user = (User) mynnuser;

                    String Name = contact_user.getName();
                    String Sname = contact_user.getSname();
                    FName = Name + " " + Sname;
                    Email = contact_user.getEmail();
                    MNumber = contact_user.getMnumber();
                    Address = contact_user.getAddress();

                }
                %>


        <div>
            <!---------------------------------------Navbar------------------------------------->
            <%@ include file = "components/navbar.jsp" %>

            <div id="mymodals">
                <!-- Modal for Add BuyProduct-->
                <div class="modal fade"  id="buyproductModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: rebeccapurple; color:white;">
                                <h1 class="modal-title fs-5" id="buyproductModalLabel"><%if(session.getAttribute("user") ==null){%>Login First<%}else{%>Add Product<%}%></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body <%if(session.getAttribute("user") ==null){%>d-none   <%}%>">
                                <form action="<%=request.getContextPath() + "/BuyNowServlet"%>" method="post" enctype="multipart/form-data">

                                    <div>
                                        <div class="mb-3">  
                                            <label class="form-label">Enter Your Full Name</label>
                                            <input type="text" class="form-control" name="UName" id="user_name" placeholder="Your Full Name" value="<%=FName%>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Enter Your Address</label>
                                            <textarea class="form-control" name="UAddrs" id="user_addrs" rows="3" placeholder="Your Address" ></textarea>
                                        </div> 
                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <input class="form-control" type="email" placeholder="Your Email" name="UEmail" id="user_email"
                                                   value="<%=Email%>" required>

                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mobile No.</label>
                                            <input class="form-control" type="number" name="MNumber" id="mnumber"
                                                   Placeholder="<%=MNumber%>" required>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Enter Quantity</label>
                                            <input class="form-control" type="number" name="qnumber" id="qnumber" Placeholder="Your Quantity" required>
                                        </div>

                                    </div>
                                    <div class="modal-footer d-flex justify-content-center align-items-center">
                                        <button type="submit" id="registerbtn"  class="btn mybtn">Submit</button>
                                    </div>

                                </form>
                                <div>




                                </div>

                            </div>

                        </div>
                    </div>

                </div>



            </div>
            <div class="mybox container d-flex gap-sm-2 gap-lg-5 ">

                <div class="col1 p-0 d-flex flex-column justify-content-center align-items-center" style="">
                    <div class="" style="width:fit-content; height: fit-content; margin:auto;" >
                        <%                            String path = "components/images" + "/" + "products" + "/" + product.getPImageName();
                        %>
                        <img id="product-img" class="ps-5 pe-5 pt-3 pb-4" src="<%=path%>" style="" alt="<%=product.getPImageName()%>"/>
                        <div class="d-flex justify-content-center align-items-center gap-5">
                            <%
                                boolean flag = true;
                                Cookie[] cookies = request.getCookies();
                                if (cookies != null) {
                                    for (Cookie cookie : cookies) {
                                        String imgname = cookie.getValue();
                                        if (imgname.equals(product.getPImageName())) {
                                            flag = false;
                                        }
//                                        out.println(imgname+"-"+product.getPImageName());

                                    }
                                }

//                                out.println(flag);
                            %>
                            <%                                if (flag) {
                            %>
                            <a href="<%=request.getContextPath() + "/AddToCart"%>"><button class="btn mybtn" style="background-color: #ff9f00;" id="cartbtn"><i class="fa-solid fa-cart-shopping"></i> Add To Cart</button></a>

                            <%
                                }
                            %>
                            <!--<a href=""><button class="btn mybtn" style="background-color:#fb641b;" id="buybtn"><i class="fa-sharp fa-solid fa-bag-shopping"></i> Buy Now</button></a>-->
                            <button class="btn mybtn" style="background-color:#fb641b;" id="buybtn" data-bs-toggle="modal" data-bs-target="#buyproductModal"><i class="fa-sharp fa-solid fa-bag-shopping" ></i> Buy Now</button>
                        </div>
                    </div>

                </div>

                <div class="col2 d-flex flex-column gap-2">
                    <h5><%=product.getPName()%></h5>
                    <div class="d-flex justify-content-start align-items-center">
                        <div class="review">
                            <span><%=product.getPRating()%></span>
                            <i class="fa-solid fa-star" style="font-size:0.8rem;"></i>


                        </div>
                        <span>(<%=product.getPReviewsNum()%> Ratings)</span>
                    </div>
                    <h6>Product Price: </h6>
                    <h4>&#8377;<%=product.getPPrice()%></h4>
                    <div>
                        <p>
                            <%=product.getPDesc()%>
                        </p>

                    </div>
                <h6>Rate This Product </h6>

                <div class="container position-relative ">
                    <div class="rating-wrap">
                        <div class="center">
                            <div class="stars">
                                <span class="star" data-rating="1">★</span>
                                <span class="star" data-rating="2">★</span>
                                <span class="star" data-rating="3">★</span>
                                <span class="star" data-rating="4">★</span>
                                <span class="star" data-rating="5">★</span>
                            </div>
                        </div>
                    </div>
                </div>
                <form action="<%=request.getContextPath()%>/components/submitreview.jsp" method="post">
                    <input type="text" id="rating_span" name="Rating" class="d-none" value="0"/>
                    <input type="text" id="imgname_span" name="Imgname" class="d-none" value="<%=product.getPImageName()%>">
              
                    <h6>Enter Product Review</h6>
                    <textarea class="form-control col-md-8 col-12" name="Message" id="message" rows="4"
                        placeholder="Your Message" autocomplete="off" required></textarea>
                    <button type="submit" id="registerbtn" class="mybtn btn" style="">Submit</button>

                </form>


                </div>           
            </div>







 <script>
            document.getElementById("home-link").classList.remove("active");

            let a = "<%= Address.trim() %>";

            document.querySelector("#user_addrs").value = a;

            // let star = document.querySelectorAll('.full');
            // let arr = [];

            // for (let i = 0; i < star.length; i++) {
            //     star[i].addEventListener('click', () => {
            //         star[i].style.display = "none";
            //     });
            // }

            let max_rating = 0;

            // Get all star elements
            let stars = document.querySelectorAll('.star');

            // Add click event listeners to stars
            stars.forEach(star => {
                star.addEventListener('click', function () {
                    const rating = parseInt(star.getAttribute('data-rating'));
                    max_rating = rating;
                    adjustRatings();
                });
            });

            function adjustRatings() {
                stars.forEach(star => {
                    const rating = parseInt(star.getAttribute('data-rating'));
                    if (rating <= max_rating) {
                        star.style.color = "green";
                    } else {
                        star.style.color = "gray";
                    }
                    document.querySelector("#rating_span").value = max_rating;
                });



            }




        </script>
            <%@ include file = "components/js/javascript.html" %>
           
            <%
                }
            %>

    </body>
</html>
