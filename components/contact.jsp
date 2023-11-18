<%@page import="Bean.User"%>
<%

    String Name = "Your Name", Sname = "Your Surname", Email = "Your Email", Mnumber = "Your Mobile Number", Password = "Your Password", Message = "Your Message";

    Object myuser = session.getAttribute("user");

    if (myuser != null) {
        User contact_user = (User) myuser;

        Name = contact_user.getName();
        Sname = contact_user.getSname();
        Email = contact_user.getEmail();
        Mnumber = contact_user.getMnumber();

    }
%>


<div style="background-color: #d8d8d8;
     box-shadow: 0px 10px 30px 4px #393939;">
    <div id="contact-us" class="container w-75 p-4">
        <h1 class="container m-auto pb-4" style="width: fit-content;">Contact Us</h1>
        <form action="<%=request.getContextPath() + "/MessageServlet"%>" method="post" class="row d-flex
              flex-column justify-content-center align-items-center">
            <div
                class="container d-flex flex-column justify-content-center align-items-center col-md-8 col-12 text-center ">
                <div class="d-md-flex justify-content-center align-items-center gap-5 col-12">
                    <label class="form-label col-md-4 col-12 ">Name</label>
                    <input class="form-control col-md-8 col-12" type="text" name="Name" id="name"
                           value="<%=Name%>" required>

                </div>

                <div class="d-md-flex justify-content-center align-items-center gap-5 col-12">
                    <label class="form-label col-md-4 col-12">Surname</label>
                    <input class="form-control col-md-8 col-12" type="text" name="Sname" id="sname"
                           value="<%=Sname%>" required>

                </div>
                <div class="d-md-flex justify-content-center align-items-center gap-5 col-12">
                    <label class="form-label col-md-4 col-12">Email</label>
                    <input class="form-control col-md-8 col-12" type="email" name="Email" id="email"
                           value="<%=Email%>" required>

                </div>



                <div class="d-md-flex justify-content-center align-items-center gap-5 col-12">
                    <label class="form-label col-md-4 col-12">Mobile No.</label>
                    <input class="form-control col-md-8 col-12" type="number" name="MNumber" id="mnumber"
                           Placeholder="<%=Mnumber%>" required>


                </div>

                <div class="d-md-flex justify-content-center align-items-center gap-5 col-12">
                    <label class="form-label col-md-4 col-12">Message</label>
                    <textarea class="form-control col-md-8 col-12" name="Message" id="message" rows="4"
                              placeholder="<%=Message%>" autocomplete="off" required></textarea>

                </div>
            </div>


            <div class="col-12 m-auto p-4" style="width: fit-content;">
                <button type="submit" id="registerbtn" class="mybtn btn" style="" disabled>Submit</button>
            </div>

        </form>
    </div>
</div>