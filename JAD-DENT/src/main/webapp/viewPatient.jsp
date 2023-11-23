<%@page import="model.Patient"%>
<%@page import="model.Controller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%String currentPage =
"patient";
Controller controller = new Controller();
int patientId = (int) request.getSession().getAttribute("patientId");
    
    Patient patient = controller.getPatient(patientId);

%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <%@include file="components/head.jsp"%>
  <body>
    <div
      class="flex h-screen bg-gray-50 dark:bg-gray-900"
      :class="{ 'overflow-hidden': isSideMenuOpen}"
    >
      <%@include file="components/sidebarPatient.jsp"%>

      <div class="flex flex-col flex-1">
        <%@include file="components/headerPatient.jsp"%>

        <main class="h-full pb-16 overflow-y-auto">
          <div class="container px-6 mx-auto grid">
            <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Perfil
            </h2>
      
            <!-- General elements -->
            
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
                <label class="block text-sm">
                  <span class="text-gray-700 dark:text-gray-400">Nombre</span>
                  <input
                    value="<%=patient.getName()%>"
                    readonly
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
                      value="<%=patient.getLastName()%>"
                      readonly
                      id="lastname"
                      name="lastname"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400"
                      >Teléfono</span
                    >
                    <input
                      value="<%=patient.getPhoneNumber()%>"
                      readonly
                      id="phonenumber"
                      name="phonenumber"
                      type="text"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>
                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400"
                      >Correo electrónico</span
                    >
                    <input
                      readonly
                      value="<%=patient.getUser().getUsername()%>"
                      id="email"
                      name="email"
                      type="email"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>

                <div class="mt-4 text-sm">
                  <label class="block text-sm">
                    <span class="text-gray-700 dark:text-gray-400"
                      >Contraseña</span
                    >
                    <input
                      readonly
                      value="<%=patient.getUser().getPassword()%>"
                      id="password"
                      name="password"
                      type="password"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                      <br>
                </div>

                
                
              </div>
            
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
