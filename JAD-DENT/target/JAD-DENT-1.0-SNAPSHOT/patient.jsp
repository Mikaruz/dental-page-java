<%@page import="model.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%String currentPage =
"patient";%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <%@include file="components/head.jsp"%>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen}"
    >
      <%@include file="components/sidebar.jsp"%>

      <div class="flex flex-col flex-1 w-full">
        <%@include file="components/header.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container grid px-6 mx-auto">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Pacientes
            </h2>
            <!-- CTA -->
            <a
              class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
              href="addPatient.jsp"
            >
              <div class="flex items-center">
                <svg
                  class="w-5 h-5 mr-2"
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  stroke-width="2"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                >
                  <polygon points="14 2 18 6 7 17 3 17 3 13 14 2"></polygon>
                  <line x1="3" y1="22" x2="21" y2="22"></line>
                </svg>
                <span>Agregar paciente</span>
              </div>
            </a>

            <!-- With actions -->
            <div class="relative mb-8 focus-within:text-purple-500">
              <div class="absolute inset-y-0 flex items-center pl-2">
                <svg
                  class="w-4 h-4"
                  aria-hidden="true"
                  fill="#cd99ff"
                  viewBox="0 0 20 20"
                >
                  <path
                    fill-rule="evenodd"
                    d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                    clip-rule="evenodd"
                  ></path>
                </svg>
              </div>
              <input
                class="w-full pl-8 pr-2 text-sm text-gray-700 placeholder-gray-600 bg-gray-100 border-0 rounded-md dark:placeholder-gray-500 dark:focus:shadow-outline-gray dark:focus:placeholder-gray-600 dark:bg-gray-700 dark:text-gray-200 focus:placeholder-gray-500 focus:bg-white focus:border-purple-300 focus:outline-none focus:shadow-outline-purple form-input"
                data-table="w-full whitespace-no-wrap"
                type="text"
                placeholder="Buscar paciente"
                aria-label="Search"
              />
            </div>
            
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              
              <div class="w-full overflow-x-auto">
                
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">Paciente</th>
                      
                      <th class="px-4 py-3">Cita</th>
                      
                      <th class="px-4 py-3">Acciones</th>
                    </tr>
                  </thead>
                  <%List<Patient> patientList = (List) request.getSession().getAttribute("patientList");%>
                  <%List<Appointment> appointmentList = (List) request.getSession().getAttribute("appointmentList");%>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  >
                    <%for(Patient patient : patientList){ %>
                    <tr class="text -gray-700 dark:text-gray-400">
                      <td class="px-4 py-3">
                        <div class="flex items-center text-sm">
                          <!-- Avatar with inset shadow -->
                          <div
                            class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                          >
                            <img
                              class="object-cover w-full h-full rounded-full"
                              src="https://picsum.photos/id/<%=patient.getUser().getUserId() + 9%>/200/300"
                              alt=""
                              loading="lazy"
                            />
                            <div
                              class="absolute inset-0 rounded-full shadow-inner"
                              aria-hidden="true"
                            ></div>
                          </div>
                          <div>
                            <p class="font-semibold"><%=patient.getName() + " " + patient.getLastName()%></p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                              <%=patient.getDni()%></p>
                          </div>
                        </div>
                      </td>
                      
                    
                      <td class="px-4 py-3 text-xs">
                        <% boolean hasAppointment = false;
                        boolean foundPendingAppointment = false;

                        for (Appointment appointment : appointmentList) {
                            if (appointment.getPatient().getPatientId() == patient.getPatientId()) {
                                if ("paid".equals(appointment.getStatus())) {
                                    // Si hay una cita pagada, no cambiamos el estado de hasAppointment
                                } else if ("pending".equals(appointment.getStatus())) {
                                    foundPendingAppointment = true;
                                }
                            }
                        }

                        hasAppointment = foundPendingAppointment;

                          if (hasAppointment) {
                        %>
                        <span
                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                          Cita programada
                        </span>
                        <% } else { %>
                          <span
                          class="px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600"
                        >
                          Sin cita
                        </span>
                        <% } %>
                      </td>
                      <td class="px-4 py-3">
                        <div class="flex items-center space-x-4 text-sm">
                            
                            
                          
                          <form name="edit" action="EditPatientServlet" method="GET">
                            <button
                              class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                              aria-label="Edit"
                            >
                              <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="currentColor"
                                viewBox="0 0 20 20"
                              >
                                <path
                                  d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"
                                ></path>
                              </svg>
                            </button>
                            <input type="hidden" name="patientid" value="<%=patient.getPatientId()%>">
                            <input type="hidden" name="userid" value="<%=patient.getUser().getUserId()%>">
                          </form>
                          <form name="delete" action="DeletePatientServlet" method="POST">
                            <button
                              class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                              aria-label="Delete"
                            >
                              <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="currentColor"
                                viewBox="0 0 20 20"
                              >
                                <path
                                  fill-rule="evenodd"
                                  d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                  clip-rule="evenodd"
                                ></path>
                              </svg>
                            </button>
                            <input type="hidden" name="patientid" value="<%=patient.getPatientId()%>">
                            <input type="hidden" name="userid" value="<%=patient.getUser().getUserId()%>">
                          </form>
                          <%if(hasAppointment == false){%>
                            
                            <form name="edit" action="AppointmentDetailsServlet" method="GET">
                            <button
                              class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                              aria-label="Edit"
                            >
                              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            </button>
                            <input type="hidden" name="patientId" value="<%=patient.getPatientId()%>">
                            <input type="hidden" name="userId" value="<%=patient.getUser().getUserId()%>">
                          </form>
                                
                            <%}%>
                        </div>
                      </td>
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
