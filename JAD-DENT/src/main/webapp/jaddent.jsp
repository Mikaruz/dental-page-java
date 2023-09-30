<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulario de Consulta</title>
</head>
<body>
    <h1>Formulario de Consulta</h1>
    <form action="CreatePendingAppointmentServlet" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="apellido">Apellido:</label>
        <input type="text" id="lastname" name="lastname" required><br><br>

        
        <label for="dni">DNI:</label>
        <input type="text" id="dni" name="dni" required><br><br>

        <label for="correo">Correo:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="fecha">Fecha:</label>
        <input type="date" id="date" name="date" required><br><br>

        <label for="telefono">Teléfono:</label>
        <input type="text" id="phonenumber" name="phonenumber"><br><br>

        <label for="speciality">Motivo de Consulta:</label>
        <select id="speciality" name="speciality">
            <option value="Consulta General">Consulta General</option>
            <option value="Problemas Dentales">Problemas Dentales</option>
            <option value="Limpieza">Limpieza</option>
            <option value="Ortodoncia">Ortodoncia</option>
        </select><br><br>

        <label for="reason">Observaciones:</label><br>
        <textarea id="reason" name="reason" rows="4" cols="50"></textarea><br><br>

        <input type="submit" value="Enviar Consulta">
    </form>
</body>
</html>
