<%@page import="java.util.Optional"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String currentPage = "index";%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <%@include file="components/head.jsp"%>
<%int totalPendingAppointments = (int) request.getSession().getAttribute("totalPendingAppointments");%>
<%int completeAppointments = (int) request.getSession().getAttribute("completeAppointments");%>

<%int firstDentalIssue = (int) request.getSession().getAttribute("firstDentalIssue");%>
<%int secondDentalIssue = (int) request.getSession().getAttribute("secondDentalIssue");%>
<%int thirdDentalIssue = (int) request.getSession().getAttribute("thirdDentalIssue");%>
<%int visitCount = (int) getServletContext().getAttribute("visitCount");%>

<%
    int mondayAppointments = (int) request.getSession().getAttribute("mondayAppointments");
    int tuesdayAppointments = (int) request.getSession().getAttribute("tuesdayAppointments");
    int wednesdayAppointments = (int) request.getSession().getAttribute("wednesdayAppointments");
    int thursdayAppointments = (int) request.getSession().getAttribute("thursdayAppointments");
    int fridayAppointments = (int) request.getSession().getAttribute("fridayAppointments");
    int saturdayAppointments = (int) request.getSession().getAttribute("saturdayAppointments");
    int sundayAppointments = (int) request.getSession().getAttribute("sundayAppointments");         
%>


<%double totalAppointmentPrice = (double) request.getSession().getAttribute("totalAppointmentPrice");%>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen }"
    >
      <%@include file="components/sidebar.jsp"%>

      <div class="flex flex-col flex-1 w-full">
        <%@include file="components/header.jsp"%>
        
        <main class="h-full overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Dashboard
            </h2>
            <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Visitas totales
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    <%=visitCount%>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      fill-rule="evenodd"
                      d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                      clip-rule="evenodd"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Dinero generado
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    S/. <%=totalAppointmentPrice%>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500"
                >
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Citas completadas
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    <%=completeAppointments%>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500"
                >
                  <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
                      fill-rule="evenodd"
                      d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
                      clip-rule="evenodd"
                    ></path>
                  </svg>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Citas pendientes
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    <%=totalPendingAppointments%>
                  </p>
                </div>
              </div>
            </div>

            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Gráficos
            </h2>
             <script>
                document.addEventListener('DOMContentLoaded', function() {

                // Aquí va el script que proporcionaste
                const pieConfig = {
                  type: 'doughnut',
                  data: {
                    datasets: [
                      {
                        data: [<%=firstDentalIssue%>, <%=secondDentalIssue%>, <%=thirdDentalIssue%>],
                        backgroundColor: ['#0694a2', '#1c64f2', '#7e3af2'],
                        label: 'Dataset 1',
                      },
                    ],
                    labels: ['Odontologia general', 'Endodoncia', 'Cirugia bucomaxifacial'],
                  },
                  options: {
                    responsive: true,
                    cutoutPercentage: 80,
                    legend: {
                      display: false,
                    },
                  },
                }

                const pieCtx = document.getElementById('pie');
                window.myPie = new Chart(pieCtx, pieConfig);});
              </script>
              <script>
                document.addEventListener('DOMContentLoaded', function() {

                                  /**
                * For usage, visit Chart.js docs https://www.chartjs.org/docs/latest/
                */
                const barConfig = {
                  type: 'bar',
                  data: {
                    labels: ['Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado'],
                    datasets: [
                      {
                        label: 'Cita',
                        backgroundColor: '#1c64f2',
                        // borderColor: window.chartColors.red,
                        borderWidth: 1,
                        data: [<%=mondayAppointments%>, <%=tuesdayAppointments%>, <%=wednesdayAppointments%>, <%=thursdayAppointments%>, <%=fridayAppointments%>, <%=saturdayAppointments%>],
                      },
                    ],
                  },
                  options: {
                    responsive: true,
                    legend: {
                      display: false,
                    },
                  },
                }

                const barsCtx = document.getElementById('bars')
                window.myBar = new Chart(barsCtx, barConfig)

                });
              </script>
 
            <div class="grid gap-6 mb-8 md:grid-cols-2">
              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                  Citas por especialidad
                </h4>
                
                <canvas id="pie"></canvas>
                <div
                  class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                >
                  <!-- Chart legend -->
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-teal-500 rounded-full"
                    ></span>
                    <span>Odontologia general</span>
                  </div>
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-blue-600 rounded-full"
                    ></span>
                    <span>Endodoncia</span>
                  </div>
                  <div class="flex items-center">
                    <span
                      class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                    ></span>
                    <span>Cirugia bucomaxifacial</span>
                  </div>
                </div>
              </div>
              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                  Registro de citas de esta semana
                </h4>
                <canvas id="bars"></canvas>
                <div
                  class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                >
                  
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
