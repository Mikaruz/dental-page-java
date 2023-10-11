<%@page import="model.Appointment"%>
<%@page import="model.Dentist"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.Patient"%>
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

      <div class="flex flex-col flex-1">
        <%@include file="components/header.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Editar cita
            </h2>
            <%Patient patient = (Patient) request.getSession().getAttribute("editPatient");%>
            <%Appointment appointment = (Appointment) request.getSession().getAttribute("editAppointment");%>
            
            <!-- General elements -->
            <form class="dentist" action="CreateAppointmentPatientServlet" method="POST">
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
              <label class="block text-sm">
                <span class="text-gray-700 dark:text-gray-400">Paciente</span>
                <input
                  readonly
                  value="<%=patient.getName() + " " + patient.getLastName()%>"
                  id="name"
                  name="name"
                  type="text"
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                />
              </label>
                <label class="block mt-4 text-sm">
                  <span class="text-gray-700 dark:text-gray-400">
                    Dentista
                  </span>
                  <%List<Dentist> dentistList = (List) request.getSession().getAttribute("dentistList");%>
                  <select
                    id="dentistid"
                    name="dentistid"
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                  >
                  <%for(Dentist dentist : dentistList){ %>
                    <option value="<%=dentist.getDentistId()%>"><%=dentist.getName() + " " + dentist.getLastName() + " - " + dentist.getSpecialty() %></option>
                    <% } %>

                  </select>
                </label>
                <div class="mt-4 text-sm">
                  <div class="flex space-x-4">
                    <div class="flex-1">
                      <label class="block text-sm">
                        <span class="text-gray-700 dark:text-gray-400"
                          >Fecha</span
                        >
                        <input
                          id="turndate"
                          name="turndate"
                          type="date"
                          class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        />
                      </label>
                    </div>
                    <div class="flex-1">
                      <label class="block text-sm">
                        <span class="text-gray-700 dark:text-gray-400"
                          >Hora</span
                        >
                        <input
                        value="<%=appointment.getTurnTime()%>"
                          id="turntime"
                          name="turntime"
                          type="time"
                          class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        />
                      </label>
                    </div>
                  </div>
                </div>

                

                    
                    
                <input type="hidden" name="patientid" value="<%=patient.getPatientId()%>">
                <br />
                <div class="mt-4 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Editar
                  </button>
                </div>
              </div>
            </form>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
