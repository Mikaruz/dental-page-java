<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PendingAppointment"%> <%@page import="model.Dentist"%>
<%@page import="java.util.List"%> <%@page import="java.util.List"%> <%@page
import="model.Patient"%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String currentPage = "appointment";%>
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
              Cita pendiente
            </h2>
            <%PendingAppointment pendingAppointment = (PendingAppointment)
            request.getSession().getAttribute("pendingAppointment");%>
            <!-- General elements -->
            <form
              action="CreateNewPatientAppointmentServlet"
              method="POST"
            >
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
                <label class="block text-sm">
                  <span class="text-gray-700 dark:text-gray-400">Nombre</span>
                  <input
                    readonly
                    value="<%=pendingAppointment.getName()%>"
                    id="name"
                    name="name"
                    type="text"
                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                  />
                </label>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400"
                      >Apellido</span
                    >
                    <input
                      readonly
                      value="<%=pendingAppointment.getLastName()%>"
                      id="lastname"
                      name="lastname"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400">DNI</span>
                    <input
                      readonly
                      value="<%=pendingAppointment.getDni()%>"
                      id="dni"
                      name="dni"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400">Correo electrónico</span>
                    <input
                      readonly
                      value="<%=pendingAppointment.getDni()%>"
                      id="email"
                      name="email"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400">Teléfono</span>
                    <input
                      readonly
                      value="<%=pendingAppointment.getPhoneNumber()%>"
                      id="phonenumber"
                      name="phonenumber"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400">Motivo</span>
                    <input
                      readonly
                      value="<%=pendingAppointment.getSpeciality()%>"
                      id="speciality"
                      name="speciality"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <%SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");  %>
                    <% String date = dateFormat.format(pendingAppointment.getDate()); %>
                    <span class="text-gray-700 dark:text-gray-400">Día disponible</span>
                    <input
                      readonly
                      value="<%=date%>"
                      id="email"
                      name="email"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <label class="block mt-4 text-sm">
                  <span class="text-gray-700 dark:text-gray-400">Observaciones</span>
                  <textarea
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    rows="3"
                    name="reason"
                  ><%=pendingAppointment.getReason()%></textarea>
                </label>
                <input type="hidden" name="pendingappointmentid" value="<%=pendingAppointment.getPendingAppointmentId()%>">
                <br />
                <div class="mt-4 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Agendar
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
