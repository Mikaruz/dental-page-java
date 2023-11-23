<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Desktop sidebar -->
<aside
  class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0"
>
  <div class="py-4 text-gray-500 dark:text-gray-400">
    <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
      Jad-Dent
    </a>
    <ul class="mt-6">
      <li class="relative px-6 py-3">
        <% if ("patient".equals(currentPage)) { %>
          <span
            class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
            aria-hidden="true"
          ></span>
          <% } %>
          <a
          <% if ("patient".equals(currentPage)) { %>
          class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
          <% } else{%>
          class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
          <% } %>
          href="viewDentist.jsp"
        >
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
          <span class="ml-4">Perfil</span>
        </a>
      </li>
    </ul>
    <ul>

      <li class="relative px-6 py-3">
        <% if ("appointment".equals(currentPage)) { %>
          <span
            class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
            aria-hidden="true"
          ></span>
          <% } %>
          <a
          <% if ("appointment".equals(currentPage)) { %>
          class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
          <% } else{%>
          class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
          <% } %>
          href="viewAppointmentDentist.jsp"
        >
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
            <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
            <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
          </svg>
          <span class="ml-4">Citas</span>
        </a>
      </li>
      
      
     
    </ul>
    
  </div>
</aside>
<!-- Mobile sidebar -->
<!-- Backdrop -->
<div
  x-show="isSideMenuOpen"
  x-transition:enter="transition ease-in-out duration-150"
  x-transition:enter-start="opacity-0"
  x-transition:enter-end="opacity-100"
  x-transition:leave="transition ease-in-out duration-150"
  x-transition:leave-start="opacity-100"
  x-transition:leave-end="opacity-0"
  class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"
></div>
<aside
  class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
  x-show="isSideMenuOpen"
  x-transition:enter="transition ease-in-out duration-150"
  x-transition:enter-start="opacity-0 transform -translate-x-20"
  x-transition:enter-end="opacity-100"
  x-transition:leave="transition ease-in-out duration-150"
  x-transition:leave-start="opacity-100"
  x-transition:leave-end="opacity-0 transform -translate-x-20"
  @click.away="closeSideMenu"
  @keydown.escape="closeSideMenu"
>
  <div class="py-4 text-gray-500 dark:text-gray-400">
    <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
      Jad-Dent
    </a>
    <ul class="mt-6">
      <li class="relative px-6 py-3">
        <% if ("patient".equals(currentPage)) { %>
          <span
            class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
            aria-hidden="true"
          ></span>
          <% } %>
          <a
          <% if ("patient".equals(currentPage)) { %>
          class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
          <% } else{%>
          class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
          <% } %>
          href="viewDentist.jsp"
        >
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
          <span class="ml-4">Perfil</span>
        </a>
      </li>
    </ul>
    <ul>
      
      <li class="relative px-6 py-3">
        <% if ("appointment".equals(currentPage)) { %>
          <span
            class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
            aria-hidden="true"
          ></span>
          <% } %>
          <a
          <% if ("appointment".equals(currentPage)) { %>
          class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
          <% } else{%>
          class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
          <% } %>
          href="viewAppointmentDentist.jsp"
        >
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
            <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
            <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
          </svg>
          <span class="ml-4">Citas</span>
        </a>
      </li>
      
     
    </ul>
  </div>
</aside>
