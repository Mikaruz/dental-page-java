<%@page import="model.Dentist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%String currentPage =
"dentist";%>
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
              Editar dentista
            </h2>
            <%Dentist dentist = (Dentist) request.getSession().getAttribute("editDentist");%>
            <!-- General elements -->
            <form class="dentist" action="EditDentistServlet" method="POST">
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
                <label class="block text-sm">
                  <span class="text-gray-700 dark:text-gray-400">Nombre</span>
                  <input
                    value="<%=dentist.getName()%>"
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
                      value="<%=dentist.getLastName()%>"
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
                      >Correo electrónico</span
                    >
                    <input
                      readonly
                      value="<%=dentist.getUser().getUsername()%>"
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
                      value="<%=dentist.getUser().getPassword()%>"
                      id="password"
                      name="password"
                      type="password"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                    />
                  </label>
                </div>

                <label class="block mt-4 text-sm">
                  <span class="text-gray-700 dark:text-gray-400">
                    Especialidad
                  </span>
                  <select
                    id="specialty"
                    name="specialty"
                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                  >
                  <option value="Odontologia general">Odontología general</option>
                  <option value="Odontopediatria">Odontopediatría</option>
                  <option value="Ortodoncia">Ortodoncia</option>
                  <option value="Cirugia maxilofacial y oral">Cirugía maxilofacial y oral</option>
                  </select>
                </label>
                <div class="mt-4 text-sm">
                  <div class="flex space-x-4">
                    <div class="flex-1">
                      <label class="block text-sm">
                        <span class="text-gray-700 dark:text-gray-400"
                          >Entrada</span
                        >
                        <input
                          required
                          id="begintime"
                          name="begintime"
                          type="time"
                          class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        />
                      </label>
                    </div>
                    <div class="flex-1">
                      <label class="block text-sm">
                        <span class="text-gray-700 dark:text-gray-400"
                          >Salida</span
                        >
                        <input
                          required
                          id="endtime"
                          name="endtime"
                          type="time"
                          class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                        />
                      </label>
                    </div>
                  </div>
                </div>
                <br />
                <div class="mt-4 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Guardar
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
