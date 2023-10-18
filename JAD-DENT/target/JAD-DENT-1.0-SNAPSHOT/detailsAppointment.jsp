<%@page import="model.Dentist"%>
<%@page import="java.util.List"%>
<%@page import="model.Appointment"%>
<%@page import="model.Patient"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%String currentPage =
"appointment";%>
 <%Patient patient = (Patient) request.getSession().getAttribute("patient");%>
             <%String specialty = (String) request.getSession().getAttribute("specialty");  %>
             <%String dentalIssue = (String) request.getSession().getAttribute("dentalIssue");  %>
             
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
              Detalles de la cita
            </h2>
           <form class="dentist" action="CreateAppointmentPatientServlet" method="POST" name="formulario1">
              <input type="hidden" id="id" name="patientid" value="<%=patient.getPatientId()%>"/>
        
             <div class="grid gap-6 mb-8 md:grid-cols-2">
              <div
                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
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
            <label class="block text-sm mt-4">
                <span class="text-gray-700 dark:text-gray-400">Especialidad</span>
                <input
                  readonly
                  value="<%=specialty%>"
                  id="specialty"
                  name="specialty"
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
                <option value="<%=dentist.getDentistId()%>"><%=dentist.getName() + " " + dentist.getLastName()%></option>
                <% } %>

              </select>
            </label>
                <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">Motivo</span>
                <input
                  readonly
                  value="<%=dentalIssue%>"
                  id="dentalIssue"
                  name="dentalIssue"
                  type="text"
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                />
              </label>
                  
                  
                 <% if(dentalIssue.equals("Implantes dentales") || dentalIssue.equals("Tratamiento de conducto") || dentalIssue.equals("Extraccion dental")){ %>
                     
                  
                <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">Cantidad de dientes</span>
                <input
                  
                  id="number"
                  name="number"
                  type="number"
                  class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                />
              </label>
                     
                    <% } %>
                    
                    
                    
                    <% if(dentalIssue.equals("Tratamiento de enfermedades de encias")){ %>
                    <div class="mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Tratamiento
                </span>
                <div class="mt-2">
                  <label class="inline-flex items-center text-gray-600 dark:text-gray-400">
                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="one">
                    <span class="ml-2">Gengivitis</span>
                  </label>
                  <label class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400">
                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="two">
                    <span class="ml-2">Periondinitis</span>
                  </label>
                </div>
              </div>
                  <% } %>   
                    
                    
                    
                    <% if(dentalIssue.equals("Profilaxis")){ %>
               <div class="mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Añadir Flúor
                </span>
                <div class="mt-2">
                  <label class="inline-flex items-center text-gray-600 dark:text-gray-400">
                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="three">
                    <span class="ml-2">Si</span>
                  </label>
                  <label class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400">
                    <input type="radio" class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="four">
                    <span class="ml-2">No</span>
                  </label>
                </div>
              </div>
                   <% } %>  
                    
                    
                    
                    
                    
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
                          id="turntime"
                          name="turntime"
                          type="time"
                          class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        />
                      </label>
                    </div>
                  </div>
                        <label class="block mt-4 text-sm">
                  <span class="text-gray-700 dark:text-gray-400">Observaciones</span>
                  <textarea
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                    rows="3"
                    id="observations"
                    name="observations"
                  ></textarea>
                </label>
                </div>
                    <div class="mt-8 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Agendar
                  </button>
                </div>
               
                    
              </div>
                    </form>
              <div>
                <img src="assets/img/odontogram.jpg" alt="">
              </div>
            </div>
            
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
