<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String currentPage = "index";%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
  <%@include file="components/head.jsp"%>

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
            <!-- Cards -->
            
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
