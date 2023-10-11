<%@page import="model.Appointment"%>
<%@page import="model.Patient"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%String currentPage =
"appointment";%>

<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <%@include file="components/head.jsp"%>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen}"
    >
      <!-- Desktop sidebar -->
      <%@include file="components/sidebar.jsp"%>
      <div class="flex flex-col flex-1">
        <%@include file="components/header.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Pagar
            </h2>

          <%Appointment appointment = (Appointment) request.getSession().getAttribute("paidAppointment");%>
         <%Patient patient = (Patient) request.getSession().getAttribute("paidPatient");%>
             <%double igv = (double) request.getSession().getAttribute("igv");  %>
           
             <%SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  %>
             
             <% String date = dateFormat.format(appointment.getTurnDate()); %>
            <div class="grid gap-6 mb-8 md:grid-cols-2">
                <div>
                  <img src="assets/img/jaddent.jpg" alt="">
                </div>
              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                
                <p class="text-gray-600 dark:text-gray-400">JAD-DENT E.I.R.L.</p>
                <p class="text-gray-600 dark:text-gray-400">RUC: 20547087004</p>
                <p class="text-gray-600 dark:text-gray-400">Consultorio Laboratorio</p>
                <p class="text-gray-600 dark:text-gray-400">SEC 3 MZA. F LOTE. 14 GRU. RES 9</p>
                <p class="text-gray-600 dark:text-gray-400">(ALTURA DE AV CENTRAL CON MARIATEGUI)  </p>
                <p class="text-gray-600 dark:text-gray-400">LIMA / LIMA / VILLA EL SALVADOR</p>
                <h4 class="mb-1 mt-4 font-semibold text-gray-600 dark:text-gray-300">
                 Boleta de venta electrónica
                 </h4>
                
                <p class="text-gray-600 dark:text-gray-400">Paciente: <%=patient.getName() + " " + patient.getLastName() %></p>
                <p class="text-gray-600 dark:text-gray-400">DNI: <%=patient.getDni() %></p>
                <p class="text-gray-600 dark:text-gray-400">Nro teléfono: <%=patient.getPhoneNumber() %></p>
                <p class="text-gray-600 dark:text-gray-400">Moneda: SOL</p>
                <p class="text-gray-600 dark:text-gray-400">Fecha de emisión: <%=date %></p>
                
                <h4 class="mb-1 mt-4 font-semibold text-gray-600 dark:text-gray-300">
                  Detalle del servicio
                 </h4>
                <p class="text-gray-600 dark:text-gray-400"><%=appointment.getDentalIssue() + " (S/ " + appointment.getPrice() + ")"%></p>

                <p class="text-gray-600 mt-4 dark:text-gray-400">OP. GRAVADA: <%="S/ " + appointment.getPrice()%></p>
                <p class="text-gray-600 dark:text-gray-400">OP. EXONERADA: S/ 0</p>
                <p class="text-gray-600 dark:text-gray-400">OP. INAFECTA: S/ 0</p>
                <p class="text-gray-600 dark:text-gray-400">IGV: <%="S/ " + igv%></p>
                <p class="text-gray-600 dark:text-gray-400">IMPORTE TOTAL: <%="S/ " + (appointment.getPrice() + igv)%></p>

              </div>

              
            </div>
                <form class="dentist" action="PaidAppointmentServlet" method="POST">
                    <input type="hidden" name="appointmentid" value="<%=appointment.getAppointmentId()%>">
               <div class="mt-1 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Pagar
                  </button>
                </div> 
                </form>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
