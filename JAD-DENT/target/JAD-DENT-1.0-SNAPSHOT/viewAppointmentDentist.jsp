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
      <%@include file="components/sidebarDentist.jsp"%>
      <div class="flex flex-col flex-1">
        <%@include file="components/headerDentist.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Citas
            </h2>

            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">Paciente</th>
                     
                      <th class="px-4 py-3">Motivo</th>

                      <th class="px-4 py-3">Dia</th>
                      <th class="px-4 py-3">Hora</th>
                     
                     
                    </tr>
                  </thead>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  > 
                    <%SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  %>
                    <%for(Appointment appointment : appointmentDentistList){ %>
                    <tr class="text -gray-700 dark:text-gray-400">
                        
                        <td class="px-4 py-3">
                        <div class="flex items-center text-sm">
                          <!-- Avatar with inset shadow -->
                          <div
                            class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                          >
                            <img
                              class="object-cover w-full h-full rounded-full"
                              src="https://picsum.photos/id/<%=appointment.getPatient().getUser().getUserId() + 9%>/200/300"
                              alt=""
                              loading="lazy"
                            />
                            <div
                              class="absolute inset-0 rounded-full shadow-inner"
                              aria-hidden="true"
                            ></div>
                          </div>
                          <div>
                            <p class="font-semibold"><%=appointment.getPatient().getName() + " " + appointment.getPatient().getLastName()%></p>
                          </div>
                        </div>
                      </td>
                      
                      
                      <td class="px-4 py-3 text-sm"><%=appointment.getDentalIssue()%></td>
                      <% String date = dateFormat.format(appointment.getTurnDate()); %>
                      <td class="px-4 py-3 text-xs">
                        <span
                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                          <%=date%>
                        </span>
                      </td>
                      <td class="px-4 py-3 text-sm"><%=appointment.getTurnTime()%></td>
                      
                      
                    </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
            
            </div>

         
             
           
            
            
                
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
