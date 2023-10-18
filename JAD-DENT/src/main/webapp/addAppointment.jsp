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
              Agendar cita
            </h2>
            <%Patient patient = (Patient) request.getSession().getAttribute("appointmentPatient");%>
            <!-- General elements -->
            <form class="dentist" action="AppointmentDetailsServlet" method="POST" name="formulario1">
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
                    Especialidad
                  </span>
                 
                  <select
                  onchange="cambia()"
                    id="specialty"
                    name="specialty"
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                  >
                  <option value="0">-</option>
                    <option value="1">Odontologia general</option>
                    <option value="2">Endodoncia</option>
                    <option value="3">Cirugia bucomaxilofacial</option>
                  </select>
                </label>
              </label>
              <label class="block mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Tratamiento
                </span>
                
                <select
                  id="dentistid"
                  name="dentalIssue"
                  class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                >
                  
                <option value="-">-

                  

                </select>
              </label>
              <script type="text/javascript">
                //1) Definir Las Variables Correspondintes
                var opt_1 = new Array ("-", "Profilaxis", "Blanqueamiento dental", "Tratamiento de enfermedades de encias", "Ortodoncia", "Implantes dentales");
                var opt_2 = new Array ("-", "Tratamiento de conducto");
                var opt_3 = new Array ("-", "Extraccion dental");
                
                // 2) crear una funcion que permita ejecutar el cambio dinamico
                
                function cambia(){
                  var cosa;
                  //Se toma el vamor de la "cosa seleccionada"
                  cosa = document.formulario1.specialty[document.formulario1.specialty.selectedIndex].value;
                  //se chequea si la "cosa" esta definida
                  if(cosa!=0){
                    //selecionamos las cosas Correctas
                    mis_opts=eval("opt_" + cosa);
                    //se calcula el numero de cosas
                    num_opts=mis_opts.length;
                    //marco el numero de opt en el select
                    document.formulario1.dentalIssue.length = num_opts;
                    //para cada opt del array, la pongo en el select
                    for(i=0; i<num_opts; i++){
                      document.formulario1.dentalIssue.options[i].value=mis_opts[i];
                      document.formulario1.dentalIssue.options[i].text=mis_opts[i];
                    }
                    }else{
                      //si no habia ninguna opt seleccionada, elimino las cosas del select
                      document.formulario1.dentalIssue.length = 1;
                      //ponemos un guion en la unica opt que he dejado
                      document.formulario1.dentalIssue.options[0].value="-";
                      document.formulario1.dentalIssue.options[0].text="-";
                    }
                    //hacer un reset de las opts
                    document.formulario1.dentalIssue.options[0].selected = true;
                    
                  }
                
                
              
              </script>
          

                

                

                    
                    
                <input type="hidden" name="patientid" value="<%=patient.getPatientId()%>">
                <br />
                <div class="mt-4 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Siguiente
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
