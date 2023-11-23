<%@page import="model.ToothAppointment"%>
<%@page import="model.Patient"%>
<%@ page import="java.util.Collections" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%String currentPage =
"appointment";
     List<ToothAppointment> myToothAppointmentList = (List) request.getSession().getAttribute("myToothAppointmentList");
   Appointment appointment = (Appointment) request.getSession().getAttribute("appointment");%>


<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <%@include file="components/head.jsp"%>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen}"
    >
      <!-- Desktop sidebar -->
      <%@include file="components/sidebarPatient.jsp"%>
      <div class="flex flex-col flex-1">
        <%@include file="components/headerPatient.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Cita
            </h2>

          

         
             
           
            
            <%SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  %>
           <% String date = dateFormat.format(appointment.getTurnDate()); %>
            <div class="grid gap-6 mb-8 md:grid-cols-2">
          
              <div
                class="min-w-0 p-4 text-white bg-purple-600 rounded-lg shadow-xs"
              >
                <h4 class="mb-4 font-semibold">
                  Detalles:
                </h4>
                <p>
                   Dentista:
                  <%=appointment.getDentist().getName() + " " + appointment.getDentist().getLastName()%>
                 
                </p>
                <p>Motivo: <%= appointment.getDentalIssue()%></p>
                <p>Fecha:
                <%=date %>
                </p>
                <p>Hora:
                <%=appointment.getTurnTime() %>
                </p>
                <p>Precio: S/.
                <%=appointment.getPrice() %>
                </p>
              </div>

              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <h4 class="mb-4 font-semibold text-gray-600 dark:text-gray-300">
                  Comentario:
                </h4>
                <p class="text-gray-600 dark:text-gray-400">
                    <%=appointment.getObservations() %>
                </p>
              </div>


              <% if (!myToothAppointmentList.isEmpty()) { %>

              </div>
              <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Dientes:
            </h2>

                 <div class="flex items-center space-x-4">
    <% for (ToothAppointment toothAppointment : myToothAppointmentList) { %>
        <div class="text-center">
            <p class="text-gray-600 dark:text-gray-400">
                <%=toothAppointment.getName() %>
            </p>
            <img
               
                src="assets/img/teeth/tooth-<%=toothAppointment.getName() %>.jpg"
                alt="Tooth Image"
            >
        </div>
    <% } %>
</div>
            <% } else { %>
             
            <% } %>
           
                
              
              

          </div>
        </main>
      </div>
    </div>
  </body>
</html>
