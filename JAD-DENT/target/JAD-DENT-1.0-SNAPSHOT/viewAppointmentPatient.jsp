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
      <%@include file="components/sidebarPatient.jsp"%>
      <div class="flex flex-col flex-1">
        <%@include file="components/headerPatient.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Citas
            </h2>

          

         
             
           
            <% if(lastAppointment != null){     %>
            <%SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  %>
           <% String date = dateFormat.format(lastAppointment.getTurnDate()); %>
            <div class="grid gap-6 mb-8 md:grid-cols-2">
          
              <div
                class="min-w-0 p-4 text-white bg-purple-600 rounded-lg shadow-xs"
              >
                <h4 class="mb-4 font-semibold">
                  Próxima cita:
                </h4>
                <p>
                   Dentista:
                  <%=lastAppointment.getDentist().getName() + " " + lastAppointment.getDentist().getLastName()%>
                 
                </p>
                <p>Motivo: <%= lastAppointment.getDentalIssue()%></p>
                <p>Fecha:
                <%=date %>
                </p>
                <p>Hora:
                <%=lastAppointment.getTurnTime() %>
                </p>
              </div>

              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <h4 class="mb-4 font-semibold text-gray-600 dark:text-gray-300">
                  Recuerda:
                </h4>
                <p class="text-gray-600 dark:text-gray-400">
                    Te alentamos encarecidamente a llegar a tu cita con suficiente anticipación. La puntualidad nos permite proporcionarte una atención de calidad y garantiza que todos los pacientes sean atendidos a tiempo.
                </p>
              </div>
            </div>
                
                <% } else{ %>
                <div class="grid gap-6 mb-8 md:grid-cols-2">
          
              <div
                class="min-w-0 p-4 text-white bg-purple-600 rounded-lg shadow-xs"
              >
                <h4 class="mb-4 font-semibold">
                  Sin cita programada
                </h4>
                
              </div>
            </div>
                <%}%>
                
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
