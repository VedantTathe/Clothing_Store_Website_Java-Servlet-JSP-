<!--<div id="footer">
    <div class="pt-5 pb-2 container ">
        <div class="col-12 row foot-first-row pb-4">
            <div class="foot-part1  d-flex flex-column flex-md-row flex-md-nowrap flex-wrap justify-content-around  col-lg-7 gap-2 ">
                <div class="sec col-md-3 col-12">
                    <p class="card-title">ABOUT</p>
                    <div>
                        <p>Contact Us</p>
                        <p>About Us</p>
                        <p>careers</p>
                        <p>Flipkart Strories</p>
                        <p>Press</p>
                        <p>Flipkart Wholesale</p>
                        <p>Corporate Information</p>
                    </div>
                </div>
                <div class="sec col-md-3 col-12">
                    <p class="card-title">HELP</p>
                    <div>
                        <p>Payments</p>
                        <p>Shipping</p>
                        <p>Cancellation & Returns</p>
                        <p>FAQ</p>
                        <p>Report</p>
                    </div>
                </div>
                <div class="sec col-md-3 col-12">
                    <p class="card-title">CONSUMER POLICY</p>
                    <div>
                        <p>Return Policy</p>
                        <p>Terms of use</p>
                        <p>Security</p>
                        <p>Privacy</p>
                        <p>Sitemap</p>
                        <p>Grievance Redressal</p>
                        <p>EPR Compliance</p>
                    </div>
                </div>
                                <div class="sec col-md-3 col-12">
                                    <p class="card-title">SOCIAL</p>
                                    <div>
                                        <p>Facebook</p>
                                        <p>Twitter</p>
                                        <p>Youtube</p>
                
                                    </div>
                                </div>
            </div>
            <div class="foot-part2 ps-md-5 d-md-flex justify-content-around col-lg-5 gap-3 ">
                <div class="sec mysec">
                    <p class="card-title">Mail Us:</p>
                    <div>
                        <p class="">Electrosoft Internet Private Limited, </p>
                        <p class=""> MIDC Road, Near Saraswati Vidyalaya, </p>
                        <p class=""> Amravati, 444605, </p>
                        <p class=""> Maharastra, India</p>
                    </div>
                </div>
                <div class="sec mysec">
                    <p class="card-title">Registered Office Address:</p>
                    <div>
                        <p class="">Electrosoft Internet Private Limited, </p>
                        <p class=""> MIDC Road, Near Saraswati Vidyalaya, </p>
                        <p class=""> Amravati, 444605, </p>
                        <p class=""> Maharastra, India</p>
                        <p class=""> CIN : U51109KA2012PTC066107 </p>
                        <p class=""> Mobile No: 9112877202</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="foot-last-row d-md-flex justify-content-between align-items-center text-center">
            <div class="d-sm-flex justify-content-center align-items-center gap-3">
                <p >Become a Seller</p>
                <p >Help Center</p>
                <p >Help Center</p>
            </div>
            <p><i class="fa-solid fa-copyright"></i>  2023 Vedant's Electrohub<p>
            <div class="d-flex justify-content-center align-items-center gap-2 pe-md-5">
                                
                                <p><i class="fa-solid fa-envelope"></i>Email</p>
                                <p><i class="fa-brands fa-instagram"></i>Instagram</p>
                                <p><i class="fa-brands fa-youtube"></i>Youtube</p>
                                <p><i class="fa-brands fa-square-twitter"></i>Twitter</p>
                                <p><i class="fa-brands fa-square-facebook"></i>Facebook</p>
                                <p><i class="fa-brands fa-linkedin"></i>LinkedIn</p>

                <p><i class="fa-solid symbol fa-envelope"></i></p>
                <p><i class="fa-brands fa-instagram"></i></p>
                <p><i class="fa-brands fa-youtube"></i></p>
                <p><i class="fa-brands fa-square-twitter"></i></p>
                <p><i class="fa-brands fa-square-facebook"></i></p>
                <p><i class="fa-brands fa-linkedin"></i></p>

            </div>
        </div>
    </div>
</div>-->

<head>
    <style>
            #footer{
        background-color: #595957;

    }

    #footer p{
        margin: 7px;
    }
    

    .foot-part1{
        border-right: 2px solid #5e5e5e;
    }

    .foot-first-row{
        border-bottom: 2px solid #5e5e5e;

    }

    .mysec > div >p{
        margin: 2px !important;
    }

    .card-title{
        padding-bottom: 15px;
        color: #000000 !important;
    }

    #footer p{
        color: rgb(255, 255, 255);
        font-weight: 600;
    }

    .sec{
        width: fit-content;
        margin: 0 auto 0 auto;

    }



#footer p:hover {
  color: #1a1c16;
  transition: color 0.3s ease-in-out;
  position: relative;
  text-decoration: none; 
}


#footer p:hover::after {
  content: '';
  display: block;
  position: absolute;
  bottom: -2px; 
  left: 0;
  width: 100%;
  height: 2px;
  background-color: #9fc6e7;
  transform: scaleX(1);
  transform-origin: 0 50%;
  transition: transform 0.3s ease-in-out;
}


 #footer .sec p:hover {
  color: #1a1c16;
  transition: color 0.3s ease-in-out;
} 


#footer .sec p:hover::after {
  content: '';
  display: block;
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  height: 2px; 
  background-color: deeppink; 
  transform: scaleX(1);
  transform-origin: 0 50%;
  transition: transform 0.3s ease-in-out;
}

    </style>
</head>

<div id="footer">
    <div class="pt-5 pb-2 container ">
        <div class="col-12 row foot-first-row pb-4">
            <div class="foot-part1  d-flex flex-column flex-md-row flex-md-nowrap flex-wrap justify-content-around  col-lg-7 gap-2 ">
                <div class="sec col-md-3 col-12">
                    <p class="card-title">ABOUT</p>
                    <div>
                        <p><a class="nav-link active" id="home-link" aria-current="page" href="<?= $baseUrl ?>#hero-page">Home</a></p>
                        <p><a class="nav-link" href="<?= $baseUrl ?>#contact-us">Contact Us</a></p>
                        <p><a class="nav-link" href="<?= $baseUrl ?>/search.php">Search</a></p>
                        <p><a class="nav-link" href="<?= $baseUrl ?>#category">Products</a></p>
                        <p><a class="nav-link" id="cart-link" href="<?= $baseUrl ?>/mycart.php"> <i
                            class="fa-solid fa-cart-shopping"></i> Cart</a></p>
                    </div>
                </div>
                <div class="sec col-md-3 col-12">
                    <p class="card-title">HELP</p>
                    <div>
                        <p>Payments</p>
                        <p>Shipping</p>
                        <p>Cancellation & Returns</p>
                        <p>FAQ</p>
                        <p>Report</p>
                    </div>
                </div>
                <div class="sec col-md-3 col-12">
                    <p class="card-title">CONSUMER POLICY</p>
                    <div>
                        <p>Return Policy</p>
                        <p>Terms of use</p>
                        <p>Security</p>
                        <p>Privacy</p>
                        <p>Sitemap</p>
                        <p>Grievance Redressal</p>
                        <p>EPR Compliance</p>
                    </div>
                </div>
                  <div class="sec col-md-3 col-12">
                   <p class="card-title">SOCIAL</p>
                    <div>
                        <p>Facebook</p>
                        <p>Twitter</p>
                        <p>Youtube</p>
                
                    </div>
                </div>
            </div>
            <div class="foot-part2 ps-md-5 d-md-flex justify-content-around col-lg-5 gap-3 ">
                <div class="sec mysec">
                    <p class="card-title">Mail Us:</p>
                    <div>
                        <p class="">Electrosoft Internet Private Limited, </p>
                        <p class=""> MIDC Road, Near Saraswati Vidyalaya, </p>
                        <p class=""> Amravati, 444605, </p>
                        <p class=""> Maharastra, India</p>
                    </div>
                </div>
                <div class="sec mysec">
                    <p class="card-title">Registered Office Address:</p>
                    <div>
                        <p class="">Electrosoft Internet Private Limited, </p>
                        <p class=""> MIDC Road, Near Saraswati Vidyalaya, </p>
                        <p class=""> Amravati, 444605, </p>
                        <p class=""> Maharastra, India</p>
                        <p class=""> CIN : U51109KA2012PTC066107 </p>
                        <p class=""> Mobile No: 9112877202</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="foot-last-row d-md-flex justify-content-between align-items-center text-center">
            <div class="d-sm-flex justify-content-center align-items-center gap-3">
            </div>
            <p><i class="fa-solid fa-copyright"></i>  2023 Vedant's Electrohub<p>
            <div class="d-flex justify-content-center align-items-center gap-2 pe-md-5">

                <p><i class="fa-solid symbol fa-envelope"></i></p>
                <p><i class="fa-brands fa-instagram"></i></p>
                <p><i class="fa-brands fa-youtube"></i></p>
                <p><i class="fa-brands fa-square-twitter"></i></p>
                <p><i class="fa-brands fa-square-facebook"></i></p>
                <p><i class="fa-brands fa-linkedin"></i></p>

            </div>
        </div>
    </div>
</div>