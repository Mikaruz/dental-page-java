<%@page import="model.PendingAppointment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
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
      <%@include file="components/sidebar.jsp"%>

      <div class="flex flex-col flex-1 w-full">
        <%@include file="components/header.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container grid px-6 mx-auto">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Citas
            </h2>
            

            <!-- With actions -->
            <h4
              class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
            >
              Citas agendadas
            </h4>
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
                placeholder="Buscar cita"
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
                      <th class="px-4 py-3">Dentista</th>
                      <th class="px-4 py-3">Motivo</th>

                      <th class="px-4 py-3">Dia</th>
                      <th class="px-4 py-3">Hora</th>
                     
                      <th class="px-4 py-3">Acciones</th>
                    </tr>
                  </thead>
                  <%List<Appointment> appointmentList = (List) request.getSession().getAttribute("appointmentList");%>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  > 
                    <%SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  %>
                    <%for(Appointment appointment : appointmentList){ %>
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
                      <td class="px-4 py-3">
                        <div class="flex items-center text-sm">
                          <!-- Avatar with inset shadow -->
                          <div
                            class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                          >
                            <img
                              class="object-cover w-full h-full rounded-full"
                              src="https://picsum.photos/id/<%=appointment.getDentist().getUser().getUserId() + 9%>/200/300"
                              alt=""
                              loading="lazy"
                            />
                            <div
                              class="absolute inset-0 rounded-full shadow-inner"
                              aria-hidden="true"
                            ></div>
                          </div>
                          <div>
                            <p class="font-semibold"><%=appointment.getDentist().getName() + " " + appointment.getDentist().getLastName()%></p>
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
                      
                      <td class="px-4 py-3">
                        <div class="flex items-center space-x-4 text-sm">
                          <form name="paid" action="PaidAppointmentServlet" method="GET">
                            <input type="hidden" name="appointmentid" value="<%=appointment.getAppointmentId()%>">
                             <input type="hidden" name="patientid" value="<%=appointment.getPatient().getPatientId()%>">
                            <button
                              class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                              aria-label="Edit"
                            >
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
                            </button>
                            
                          </form>
                          <form name="edit" action="EditAppointmentServlet" method="GET">
                            <input type="hidden" name="appointmentid" value="<%=appointment.getAppointmentId()%>">
                             <input type="hidden" name="patientid" value="<%=appointment.getPatient().getPatientId()%>">
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
                            
                          </form>
                          <form name="delete" action="DeleteAppointmentServlet" method="POST">
                           
                            <input type="hidden" name="appointmentid" value="<%=appointment.getAppointmentId()%>">
                           
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
                            
                          </form>
                        </div>
                      </td>
                    </tr>
                    <% } %>
                  </tbody>
                </table>
              </div>
            
            </div>
            <br>
            
            <div class="flex items-center  mb-4">
              <h4 class="text-lg font-semibold text-gray-600 dark:text-gray-300">
                Citas pendientes
              </h4>
              <a href="CreatePendingAppointmentServlet">
                <button
                class="flex items-center justify-between ml-2 px-2 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-full active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                aria-label="Edit"
              >
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21.5 2v6h-6M21.34 15.57a10 10 0 1 1-.57-8.38"/></svg>
              </button></a>
              
            </div>
            
            
            
            
            
            
            <div class="w-full overflow-hidden rounded-lg shadow-xs">
              <div class="w-full overflow-x-auto">
                <table class="w-full whitespace-no-wrap">
                  <thead>
                    <tr
                      class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                    >
                      <th class="px-4 py-3">Paciente</th>
                      <th class="px-4 py-3">Teléfono</th>                     
                      <th class="px-4 py-3">Fecha</th>
                      <th class="px-4 py-3">Motivo</th>
                      <th class="px-4 py-3">Acciones</th>
                    </tr>
                  </thead>
                  <%List<PendingAppointment> pendingAppointmentList = (List) request.getSession().getAttribute("pendingAppointmentList");%>
                  <tbody
                    class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                  > 
                   
                    <%for(PendingAppointment pendingAppointment : pendingAppointmentList){ %>
                    <tr class="text -gray-700 dark:text-gray-400">
                      <td class="px-4 py-3">
                        <div class="flex items-center text-sm">
                          <!-- Avatar with inset shadow -->
                          <div
                            class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                          >
                            <img
                              class="object-cover w-full h-full rounded-full"
                              src="https://picsum.photos/id/<%=pendingAppointment.getPendingAppointmentId() + 1000%>/200/300"
                              alt=""
                              loading="lazy"
                            />
                            <div
                              class="absolute inset-0 rounded-full shadow-inner"
                              aria-hidden="true"
                            ></div>
                          </div>
                          <div>
                            <p class="font-semibold"><%=pendingAppointment.getName() + " " + pendingAppointment.getLastName()%></p>
                            <p class="text-xs text-gray-600 dark:text-gray-400">
                              <%=pendingAppointment.getDni()%></p>
                          </div>
                        </div>
                      </td>
                      <td class="px-4 py-3 text-sm"><%=pendingAppointment.getPhoneNumber()%></td>
                      <% String date = dateFormat.format(pendingAppointment.getDate()); %>
                      <td class="px-4 py-3 text-xs">
                        <span
                          class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100"
                        >
                          <%=date%>
                        </span>
                      </td>
                      <td class="px-4 py-3 text-sm"><%=pendingAppointment.getSpeciality()%></td>
                      <td class="px-4 py-3">
                        <div class="flex items-center space-x-4 text-sm">
                          <form name="view" action="ViewPendingAppointmentServlet" method="GET">
                            <button
                              class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                              aria-label="Edit"
                            >
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                            </button>
                            <input type="hidden" name="pendingappointmentid" value="<%=pendingAppointment.getPendingAppointmentId()%>">
                          </form>
                          <form name="delete" action="DeletePendingAppointmentServlet" method="POST">
                              <input type="hidden" name="pendingappointmentid" value="<%=pendingAppointment.getPendingAppointmentId()%>">
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
                            
                          </form>
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
