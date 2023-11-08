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
                    
              <img src="assets/img/jaddent.jpg" alt="">

              </div>
              
             

              <% if(dentalIssue.equals("Implantes dentales") || dentalIssue.equals("Tratamiento de conducto") || dentalIssue.equals("Tratamiento de enfermedades de encias") || dentalIssue.equals("Extraccion dental")){ %>  
            <h4
              class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
            >
              Odontograma
            </h4>

            <div class="grid gap-6 mb-8 md:grid-cols-2">
              <div class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="flex flex-wrap items-center">
                  <!-- Imagen con checkbox y número -->
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="18">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">18</span>
                    <img src="assets/img/teeth/tooth-18.jpg" class="w-16 h-auto">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="17">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">17</span>
                    <img src="assets/img/teeth/tooth-17.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="16">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">16</span>
                    <img src="assets/img/teeth/tooth-16.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="15">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">15</span>
                    <img src="assets/img/teeth/tooth-15.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="14">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">14</span>
                    <img src="assets/img/teeth/tooth-14.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="13">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">13</span>
                    <img src="assets/img/teeth/tooth-13.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="12">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">12</span>
                    <img src="assets/img/teeth/tooth-12.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="11">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">11</span>
                    <img src="assets/img/teeth/tooth-11.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>

                  
                </div>
              </div>
              <div class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="flex flex-wrap items-center">
                  <!-- Imagen con checkbox y número -->
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="21">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">21</span>
                    <img src="assets/img/teeth/tooth-21.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="22">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">22</span>
                    <img src="assets/img/teeth/tooth-22.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="23">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">23</span>
                    <img src="assets/img/teeth/tooth-23.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="24">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">24</span>
                    <img src="assets/img/teeth/tooth-24.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="25">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">25</span>
                    <img src="assets/img/teeth/tooth-25.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="26">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">26</span>
                    <img src="assets/img/teeth/tooth-26.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="27">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">27</span>
                    <img src="assets/img/teeth/tooth-27.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="28">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">28</span>
                    <img src="assets/img/teeth/tooth-28.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  
                  <!-- Repite lo mismo para las demás imágenes -->
                  <!-- ... -->
                </div>
              </div>
            </div>

            <div class="grid gap-6 mb-8 md:grid-cols-2">
              <div class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="flex flex-wrap items-center">
                  <!-- Imagen con checkbox y número -->
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="48">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">48</span>
                    <img src="assets/img/teeth/tooth-48.jpg" class="w-16 h-auto">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="47">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">47</span>
                    <img src="assets/img/teeth/tooth-47.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="46">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">46</span>
                    <img src="assets/img/teeth/tooth-46.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="45">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">45</span>
                    <img src="assets/img/teeth/tooth-45.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="44">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">44</span>
                    <img src="assets/img/teeth/tooth-44.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="43">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">43</span>
                    <img src="assets/img/teeth/tooth-43.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="42">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">42</span>
                    <img src="assets/img/teeth/tooth-42.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="tooth" value="41">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">41</span>
                    <img src="assets/img/teeth/tooth-41.jpg" class="w-16 h-auto" alt="Tooth Nine">
                  </div>

                  
                </div>
              </div>
              <div class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
                <div class="flex flex-wrap items-center">
                  <!-- Imagen con checkbox y número -->
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="31">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">31</span>
                    <img src="assets/img/teeth/tooth-31.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="32">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">32</span>
                    <img src="assets/img/teeth/tooth-32.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="33">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">33</span>
                    <img src="assets/img/teeth/tooth-33.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="34">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">34</span>
                    <img src="assets/img/teeth/tooth-34.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="35">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">35</span>
                    <img src="assets/img/teeth/tooth-35.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="36">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">36</span>
                    <img src="assets/img/teeth/tooth-36.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="37">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">37</span>
                    <img src="assets/img/teeth/tooth-37.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  <div class="flex flex-col items-center mx-1 mb-4">
                    <input type="checkbox" class="mb-2 text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray" name="aditional" value="38">
                    <span class="mb-2 text-gray-600 dark:text-gray-400">38</span>
                    <img src="assets/img/teeth/tooth-38.jpg" class="w-16 h-auto" alt="Tooth Nine" >
                  </div>
                  
                  <!-- Repite lo mismo para las demás imágenes -->
                  <!-- ... -->
                </div>
              </div>

            </div>
 <% } %>
                    

            </div>
            
 </form>
              
            

          </div>
        </main>
      </div>
    </div>
  </body>
</html>
