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
              Agregar dentista
            </h2>

            <!-- General elements -->
            <form class="dentist" action="CreateDentistServlet" method="POST">
              <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
              >
                <label class="block text-sm">
                  <span class="text-gray-700 dark:text-gray-400">Nombre</span>
                  <input
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
                    <option value="one">Especialidad 1</option>
                    <option value="two">Especialidad 2</option>
                    <option value="three">Especialidad 3</option>
                    <option value="four">Especialidad 4</option>
                  </select>
                </label>
                <br />
                <div class="mt-4 text-sm flex justify-end">
                  <button
                    type="submit"
                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                  >
                    Agregar
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