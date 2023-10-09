<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>JAD-DENT</title>

  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <meta name="author" content="Tooplate" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="icon" href="assets/img/icon.ico">
  <link rel="stylesheet" href="css/bootstrap.min.css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" />
  <link rel="stylesheet" href="css/animate.css" />
  <link rel="stylesheet" href="css/owl.carousel.css" />
  <link rel="stylesheet" href="css/owl.theme.default.min.css" />

  <!-- MAIN CSS -->
  <link rel="stylesheet" href="css/tooplate-style.css" />
</head>

<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
  <!-- PRE LOADER -->
  <section class="preloader">
    <div class="spinner">
      <span class="spinner-rotate"></span>
    </div>
  </section>

  <!-- HEADER -->
  <header>
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-5">
          <p>Bienvenidos a nuestro centro médico</p>
        </div>

        <div class="col-md-8 col-sm-7 text-align-right">
          <span class="phone-icon"><i class="fa fa-phone"></i> 994 380 537 </span>
          <span class="date-icon"><i class="fa fa-calendar-plus-o"></i> 6:00 AM - 10:00 PM
            (Lunes-Viernes)</span>
          <span class="email-icon"><i class="fa fa-envelope-o"></i>
            <a href="#">carlosvelag21@gmail.com</a></span>
        </div>
      </div>
    </div>
  </header>

  <!-- MENU -->
  <section class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon icon-bar"></span>
          <span class="icon icon-bar"></span>
          <span class="icon icon-bar"></span>
        </button>

        <!-- lOGO TEXT HERE -->
        <a href="index.html" class="navbar-brand">JAD-DENT</a>
      </div>

      <!-- MENU LINKS -->
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#top" class="smoothScroll">Inicio</a></li>
          <li><a href="#about" class="smoothScroll">Nosotros </a></li>
          <li><a href="#team" class="smoothScroll">Nuestros doctores</a></li>
          <li><a href="#news" class="smoothScroll">Novedades</a></li>
          <li><a href="#google-map" class="smoothScroll">Contáctanos</a></li>
          <li class="appointment-btn">
            <a href="#appointment">Reservar una cita</a>
          </li>
          <li class="appointment-btn">
            <a href="login.jsp">Ingresar</a>
          </li>
        </ul>
      </div>
    </div>
  </section>

  <!-- HOME -->
  <section id="home" class="slider" data-stellar-background-ratio="0.5">
    <div class="container">
      <div class="row">
        <div class="owl-carousel owl-theme">
          <div class="item item-first">
            <div class="caption">
              <div class="col-md-offset-1 col-md-10">
                <h3>Hacemos tu vida más feliz</h3>
                <h1>Vida saludable</h1>
                <a href="#team" class="section-btn btn btn-default smoothScroll">Nuestros doctores</a>
              </div>
            </div>
          </div>

          <div class="item item-second">
            <div class="caption">
              <div class="col-md-offset-1 col-md-10">
                <h3>Nuevo estlilo de vida</h3>
                <h1>Sonríe</h1>
                <a href="#about" class="section-btn btn btn-default btn-gray smoothScroll">¿Quiénes somos?</a>
              </div>
            </div>
          </div>

          <div class="item item-third">
            <div class="caption">
              <div class="col-md-offset-1 col-md-10">
                <h3>El día más malgastado de todos, es uno sin sonrisas</h3>
                <h1>Tenemos beneficios para ti</h1>
                <a href="#news" class="section-btn btn btn-default btn-blue smoothScroll">Lee nuestras reseñas</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ABOUT -->
  <section id="about">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-sm-6">
          <div class="about-info">
            <h2 class="wow fadeInUp" data-wow-delay="0.6s">
              Bienvenidos a nuestro centro médico
            </h2>
            <div class="wow fadeInUp" data-wow-delay="0.8s">
              <p class="text-justify">
                Bienvenidos a JAD-DENT, tu destino confiable para una atención odontológica excepcional y personalizada.
                En JAD-DENT, nos enorgullece ofrecer servicios dentales de alta calidad respaldados por un equipo
                apasionado de profesionales de la salud bucal.
              </p>
              <p class="text-justify">
                Nuestra misión es proporcionar a nuestros pacientes una experiencia dental integral, centrada en la
                comodidad,
                la salud y la estética. Con años de experiencia en la industria dental, nuestro equipo de expertos está
                comprometido con la excelencia clínica y la satisfacción del paciente.
              </p>
              <h2 class="wow fadeInUp" data-wow-delay="0.6s"> Valores </h2>
              <ul>
                <li> Profesionalismo</li>
                <li> Cuidado Personalizado</li>
                <li> Tecnología Avanzada</li>
                <li> Ambiente Acogedor</li>
              </ul>
              <h2 class="wow fadeInUp" data-wow-delay="0.6s"> Servicios </h2>
              <p class="text-justify">
                Ofrecemos una amplia gama de servicios dentales, desde limpiezas y chequeos regulares hasta
                procedimientos de restauración y estética avanzada. Ya sea que necesites un blanqueamiento dental para
                mejorar tu sonrisa o una restauración completa, nuestro equipo está aquí para brindarte atención
                personalizada y resultados excepcionales.
              </p>
            </div>
            <figure class="profile wow fadeInUp" data-wow-delay="1s">
              <img src="images/dueña.jpeg" class="img-responsive" alt="" />
              <figcaption>
                <h3>Dra. Lyss Kelly Garcia</h3>
                <p>Tiular-Gerente</p>
              </figcaption>
            </figure>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- TEAM -->
  <section id="team" data-stellar-background-ratio="1">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-sm-6">
          <div class="about-info">
            <h2 class="wow fadeInUp" data-wow-delay="0.1s">Nuestros doctores</h2>
          </div>
        </div>

        <div class="clearfix"></div>

        <div class="col-md-4 col-sm-6">
          <div class="team-thumb wow fadeInUp" data-wow-delay="0.2s">
            <img src="images/carlosmartin.jpeg" class="img-responsive" alt="" />

            <div class="team-info">
              <h3>Carlos Vela</h3>
              <p>Odontólogo</p>
              <div class="team-contact-info">
                <p><i class="fa fa-phone"></i> 999-124-457</p>
                <p>
                  <i class="fa fa-envelope-o"></i>
                  <a href="#">carlosmartinssj@gmail.com</a>
                </p>
              </div>
              <ul class="social-icon">
                <li><a href="#" class="fa fa-linkedin-square"></a></li>
                <li><a href="#" class="fa fa-envelope-o"></a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-6">
          <div class="team-thumb wow fadeInUp" data-wow-delay="0.4s">
            <img src="images/jesusodont.jpeg" class="img-responsive" alt="" />

            <div class="team-info">
              <h3>Jesús Gonzáles</h3>
              <p>Odontólogo</p>
              <div class="team-contact-info">
                <p><i class="fa fa-phone"></i> 999-214-654</p>
                <p>
                  <i class="fa fa-envelope-o"></i>
                  <a href="#">jesusgonz1@live.com</a>
                </p>
              </div>
              <ul class="social-icon">
                <li><a href="#" class="fa fa-facebook-square"></a></li>
                <li><a href="#" class="fa fa-envelope-o"></a></li>
                <li><a href="#" class="fa fa-flickr"></a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-6">
          <div class="team-thumb wow fadeInUp" data-wow-delay="0.6s">
            <img src="images/Jesus-alberto (2).jpeg" class="img-responsive" alt="" />

            <div class="team-info">
              <h3>Diego Flores</h3>
              <p>Odontólogo</p>
              <div class="team-contact-info">
                <p><i class="fa fa-phone"></i> 965-354-654</p>
                <p>
                  <i class="fa fa-envelope-o"></i>
                  <a href="#">diegoflow21@hotmail.com</a>
                </p>
              </div>
              <ul class="social-icon">
                <li><a href="#" class="fa fa-twitter"></a></li>
                <li><a href="#" class="fa fa-envelope-o"></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- NEWS -->
  <section id="news" data-stellar-background-ratio="2.5">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12">
          <!-- SECTION TITLE -->
          <div class="section-title wow fadeInUp" data-wow-delay="0.1s">
            <h2>Cuidados Para Tu Salud </h2>
          </div>
        </div>

        <div class="col-md-4 col-sm-6">
          <!-- NEWS THUMB -->
          <div class="news-thumb wow fadeInUp" data-wow-delay="0.4s">
            <img src="images/how-to-floss-compressor.jpg" class="img-responsive" alt="" />
            </a>
            <div class="news-info">
              <h3><a href="#">Limpieza de dientes y encías</a></h3>
              <p>
                Cepíllese suavemente los diferentes lados de los dientes con un cepillo de cerdas suaves y una pasta
                dental con flúor. Reemplace el cepillo de dientes cada tres a cuatro meses.
              </p>
              <div class="author">
                <img src="images/carlosmartin.jpeg" class="img-responsive" alt="" />
                <div class="author-info">
                  <h5>Carlos Martin</h5>
                  <p>Odontólogo</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-6">
          <!-- NEWS THUMB -->
          <div class="news-thumb wow fadeInUp" data-wow-delay="0.6s">
            <img src="images/maxresdefault.jpg" class="img-responsive" alt="" />
            </a>
            <div class="news-info">

              <h3>
                <a href="#">Alimentación saludable para tus dientes</a>
              </h3>
              <p>
                Es importante que el cuidado de dientes y encías comience desde la niñez. La nutrición, para tener una
                boca sana deben incluir en su dieta fuentes de proteínas, vitaminas C y D, calcio, fósforo y
                flúor.
              </p>
              <div class="author">
                <img src="images/Jesus-alberto (2).jpeg" class="img-responsive" alt="" />
                <div class="author-info">
                  <h5>Diego Flores</h5>
                  <p>Odontólogo</p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-6">
          <!-- NEWS THUMB -->
          <div class="news-thumb wow fadeInUp" data-wow-delay="0.8s">
            <img src="images/cada-cuando-debo-ir-al-dentista.jpg" class="img-responsive" alt="" />
            </a>
            <div class="news-info">
              <h3>
                <a href="#">Visítanos cada 6 meses</a>
              </h3>
              <p>
                Las visitas dentales regulares son importantes porque le permiten al dentista: Detectar caries
                tempranamente. El dentista revisa tus dientes para encontrar caries mientras estas aún son pequeñas.
                Cuanto antes las detectes, menos costoso será el tratamiento que necesites.
              </p>
              <div class="author">
                <img src="images/jesusodont.jpeg" class="img-responsive" alt="" />
                <div class="author-info">
                  <h5>Jesús Gonzales</h5>
                  <p>Odontólogo</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- MAKE AN APPOINTMENT -->
  <section id="appointment" data-stellar-background-ratio="3">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-sm-6">
          <img src="images/appointment-image.jpg" class="img-responsive" alt="" />
        </div>
        <form action="CreatePendingAppointmentServlet" method="POST">
        <div class="col-md-6 col-sm-6">
          <!-- CONTACT FORM HERE -->
          
            <!-- SECTION TITLE -->
            <div class="section-title wow fadeInUp" data-wow-delay="0.4s">
              <h2>Reservar una cita</h2>
            </div>

            <div class="wow fadeInUp" data-wow-delay="0.8s">
              <div class="col-md-6 col-sm-6">
                <label for="name">Nombre:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Nombres" />
              </div>

              <div class="col-md-6 col-sm-6">
                <label for="name">Apellido:</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Apellidos" />
              </div>

              <div class="col-md-6 col-sm-6">
                <label for="email">Correo electrónico:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="ejemplo@dominio.com" />
              </div>

              <div class="col-md-6 col-sm-6">
                <label for="date">Selecciona una fecha:</label>
                <input type="date" name="date" value="" class="form-control" />
              </div>

              <div class="col-md-6 col-sm-6">
                <label for="select">Selecciona departamento:</label>
                <select class="form-control" id="speciality" name="speciality">
                  <option value="Consulta General">Consulta General</option>
            <option value="Problemas Dentales">Problemas Dentales</option>
            <option value="Limpieza">Limpieza</option>
            <option value="Ortodoncia">Ortodoncia</option>
                </select>
              </div>

              <div class="col-md-6 col-sm-6">
                <label for="name">DNI:</label>
                <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI" />
              </div>

              

              <div class="col-md-12 col-sm-12">
                <label for="telephone">Teléfono:</label>
                <input type="tel" class="form-control" id="phonenumber" name="phonenumber" placeholder="xxx-xxx-xxx" />
                <label for="Message">Observaciones:</label>
                <textarea class="form-control" rows="5" id="reason" name="reason"
                  placeholder="Algún dato adicional..."></textarea>
                <button type="submit" class="form-control" id="cf-submit" name="submit">
                  Enviar consulta
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- GOOGLE MAP -->
  <section id="google-map">
    <!-- How to change your own map point
            1. Go to Google Maps
            2. Click on your location point
            3. Click "Share" and choose "Embed map" tab
            4. Copy only URL and paste it within the src="" field below
	-->
    <iframe
      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d974.8573187831013!2d-76.930090334613!3d-12.219186842532412!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105bb6006f9f2fb%3A0xeb34b0d17e022b5!2sJad-Dent%20Consultorio%20Laboratorio!5e0!3m2!1ses-419!2spe!4v1692655214752!5m2!1ses-419!2spe"
      width="100%" height="350" frameborder="0" style="border: 0" allowfullscreen></iframe>
  </section>

  <!-- FOOTER -->
  <footer data-stellar-background-ratio="5">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-4">
          <div class="footer-thumb">
            <h4 class="wow fadeInUp" data-wow-delay="0.4s">Contáctanos</h4>
            <p class="text-justify">
              Nos emociona mucho que estés interesado en ponerte en contacto con nosotros. En JAD-DENT,
              nos enorgullecemos de brindar servicios de alta calidad y soluciones innovadoras. Tu opinión, preguntas y
              comentarios son extremadamente valiosos para nosotros.


            </p>

            <div class="contact-info">
              <p><i class="fa fa-phone"></i> +51 994 380 537</p>
              <p>
                <i class="fa fa-envelope-o"></i>
                <a href="#">carlosvelag21@gmail.com</a>
              </p>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-4">
          <div class="footer-thumb">
            <h4 class="wow fadeInUp" data-wow-delay="0.4s">Últimas novedades</h4>
            <div class="latest-stories">
              <div class="stories-image">
                <a href="#"><img src="images/news-image.jpg" class="img-responsive" alt="" /></a>
              </div>
              <div class="stories-info">
                <a href="#">
                  <h5>Limpieza de dientes y encías</h5>
                </a>
                
              </div>
            </div>

            <div class="latest-stories">
              <div class="stories-image">
                <a href="#"><img src="images/news-image.jpg" class="img-responsive" alt="" /></a>
              </div>
              <div class="stories-info">
                <a href="#">
                  <h5>Visítanos cada 6 meses</h5>
                </a>
                
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-4 col-sm-4">
          <div class="footer-thumb">
            <div class="opening-hours">
              <h4 class="wow fadeInUp" data-wow-delay="0.4s">
                Horario de atención
              </h4>
              <p>Lunes - Viernes <span>06:00 AM - 10:00 PM</span></p>
              <p>Sábados <span>09:00 AM - 08:00 PM</span></p>
              <p>Domingos y feriados <span>Cerrado</span></p>
            </div>

            <ul class="social-icon">
              <li>
                <a href="https://www.facebook.com/tooplate" class="fa fa-facebook-square" attr="facebook icon"></a>
              </li>
              <li><a href="#" class="fa fa-twitter"></a></li>
              <li><a href="#" class="fa fa-instagram"></a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-12 col-sm-12 border-top">
          <div class="col-md-4 col-sm-6">
            <div class="copyright-text">
              <p>
                Copyright &copy; 2023 Jad-Dent
              </p>
            </div>
           
          </div>
         
          <div class="col-md-2 col-sm-2 text-align-center">
            <div class="angle-up-btn">
              <a href="#top" class="smoothScroll wow fadeInUp" data-wow-delay="1.2s"><i class="fa fa-angle-up"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <!-- SCRIPTS -->
  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.sticky.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/wow.min.js"></script>
  <script src="js/smoothscroll.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/custom.js"></script>
</body>

</html>