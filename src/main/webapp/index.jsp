<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.coffeesouls.Models.Producto, com.coffeesouls.Models.ProductoDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Coffee Souls </title>
    <link rel="stylesheet" href="CSS/Style-Sidebar.css">
    <link rel="stylesheet" href="CSS/swiper-bundle.min.css">
    <!-- CSS -->
    <link rel="stylesheet" href="CSS/Style-Index-Home.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Boxiocns CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<div class="sidebar close">
    <div class="logo-details">
        <i class='bx bx-coffee-togo'></i>
        <span class="logo_name">CoffeSouls</span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="index.jsp">
                <i class='bx bx-home-alt'></i>
                <span class="link_name">Home</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="index.jsp">Home</a></li>
            </ul>
        </li>
        <li>
            <a href="Dashboard.jsp">
                <i class='bx bx-grid-alt' ></i>
                <span class="link_name">Dashboard</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="Dashboard.jsp">Dashboard</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-coffee'></i>
                    <span class="link_name">Products</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Products</a></li>
                <li><a href="ManageProducto.jsp">Manage Products</a></li>
                <li><a href="#">Report for Products</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-collection' ></i>
                    <span class="link_name">Inventory</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Inventory</a></li>
                <li><a href="ManageInventario.jsp">Manage Inventory</a></li>
                <li><a href="#">Report for Inventory</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-cabinet'></i>
                    <span class="link_name">Category</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Category</a></li>
                <li><a href="ManageCategoria.jsp">Manage Category</a></li>
                <li><a href="#">Report for Category</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-dollar-circle'></i>
                    <span class="link_name">Sales</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Sales</a></li>
                <li><a href="#">Manage Sales</a></li>
                <li><a href="#">Report for Sales</a></li>
            </ul>
        </li>
        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-user-pin' ></i>
                    <span class="link_name">Employees</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Employees</a></li>
                <li><a href="ManageTrabajador.jsp">Manage Employees</a></li>
                <li><a href="#">Report for Employees</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-cog' ></i>
                <span class="link_name">Setting</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Setting</a></li>
            </ul>
        </li>
        <li>
            <div class="profile-details">
                <div class="profile-content">
                    <img src="Assets/Coffe-Icon.png" alt="profileImg">
                </div>
                <div class="name-job">
                    <div class="profile_name">Coffe User</div>
                    <div class="job">Administration</div>
                </div>
                <div class="logout">
                    <a href="Login.jsp">
                        <i class='bx bx-log-out' ></i>
                    </a>
                </div>
            </div>
        </li>
    </ul>
</div>
<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
        <span class="text">Home</span>
    </div>
    <h1><b>¡HOLA ALMA DEL CAFE!</b> Bienvenido. </h1>
        <div class="Content-ALL">
        <div class="Bienvenida">
            <P>
                En Coffee Souls, la pasión por el café se combina con la eficiencia empresarial. Nuestra plataforma de gestión integral te pone al mando de cada aspecto de tu cafetería,
                desde la selección de granos hasta la satisfacción del cliente. Con módulos especializados para Productos, Inventario,
                Categorías, Ventas, Empleados y Estadísticas, estamos aquí para impulsar el éxito de tu negocio.
            </P>
        </div>
            <img src="Assets/It'sCoffeeSouls.png">
    </div>
    <h2>Módulos</h2>
    <div class="descripcion">
        <div class ="Modulos">
            <div>
                <h3 class="h3-Mod">Productos</h3>
                <p>Nos apasiona brindarte una experiencia de café excepcional. Nuestra selección de productos cuidadosamente elaborados incluye una amplia gama de opciones para satisfacer todos los gustos y antojos. Desde el momento en que entras por la puerta, te sumerges en un mundo de aromas tentadores y sabores reconfortantes.</p>
            </div>
            <div class="div-img">
                <img src="Assets/Productos.png">
            </div>
            <div>
                <h3 class="h3-Mod">Inventario</h3>
                <p>La calidad y la satisfacción de nuestros clientes son de suma importancia, y una parte esencial de esta experiencia es la gestión cuidadosa de nuestro inventario. Estamos comprometidos a mantener un inventario fresco y abundante para brindarte siempre los productos que más te gustan.</p>
            </div>
            <div class="div-img">
                <img src="Assets/Inventario.png">
            </div>
            <div>
                <h3 class="h3-Mod">Categoria</h3>
                <p>La pasión por el café va más allá de una simple bebida; se trata de una aventura en la que cada categoría de sabores es una parada emocionante. Nuestra cuidadosa selección de categorías garantiza que haya algo para todos los gustos y deseos.</p>
            </div>
            <div class="div-img">
                <img src="Assets/Categoria.png">
            </div>
            <div>
                <h3 class="h3-Mod">Ventas</h3>
                <p>Cada transacción es más que una simple venta; es un vínculo entre nuestro delicioso café y nuestros queridos clientes. Estamos comprometidos a hacer que tu experiencia de compra sea memorable y satisfactoria.</p>
            </div>
            <div class="div-img">
                <img src="Assets/Ventas.png">
            </div>
        </div>
    </div>

    <h2>Employees</h2>
        <div class="slide-container swiper">
            <div class="slide-content">
                <div class="card-wrapper swiper-wrapper">
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Jeampier.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Jeampier Marzano</h2>
                            <p class="description">Jefe De Proyecto Coffe Souls y programador de los procesos Backend del Proyecto.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>
                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Phillip.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Phillip</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>
                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Yane.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Yanela</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Benjamin.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Benjamin</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Angie.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Angie</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Venhus.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Venhus</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Camila.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Camila</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Francis.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Francis</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <a href="https://www.instagram.com/jea.alonso_11/" class="button">View More</a>                        </div>
                    </div>
                    <div class="card swiper-slide">
                        <div class="image-content">
                            <span class="overlay"></span>
                            <div class="card-image">
                                <img src="Assets/Oscar.png" alt="" class="card-img">
                            </div>
                        </div>
                        <div class="card-content">
                            <h2 class="name">Oscar</h2>
                            <p class="description">The lorem text the section that contains header with having open functionality. Lorem dolor sit amet consectetur adipisicing elit.</p>
                            <button class="button">View More</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-button-next swiper-navBtn"></div>
            <div class="swiper-button-prev swiper-navBtn"></div>
            <div class="swiper-pagination"></div>
        </div>
</section>
<script src="JS/Sidebar.js"></script>
<script src="JS/swiper-bundle.min.js"></script>
<script src="JS/script.js"></script>
</body>
</html>
