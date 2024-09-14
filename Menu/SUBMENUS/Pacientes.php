<?php
// Seguridad de sesiones y paginación
session_start();
error_reporting(0);
$varsesion = $_SESSION['username'];
if ($varsesion == null || $varsesion == "") {
    header("location:../../index.php");
    die();
}

// Conexión a la base de datos
require_once "../../conexion.php";

// Lógica del buscador
$busqueda = "";
if (isset($_POST['buscar'])) {
    $busqueda = mysqli_real_escape_string($conexion, $_POST['busqueda']);
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú</title>
    
    <link rel="stylesheet" href="../css/output.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/custom.css"> <!-- Enlace al archivo de estilos personalizados -->

    <!-- estilos ventana modal -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <style>
        /* Estilos adicionales para garantizar la visibilidad y el posicionamiento */
        body {
            display: flex;
            height: 100vh;
            margin: 0;
            overflow: hidden; /* Previene el desbordamiento del cuerpo */
        }
        nav {
            width: 250px; /* Ajusta según tus necesidades */
            min-width: 250px;
            height: 100%;
            overflow-y: auto; /* Habilita scroll si es necesario */
            border-right: 1px solid #ccc; /* Borde para separar visualmente el menú de la tabla */
        }
        .content {
            flex-grow: 1;
            overflow-y: auto;
            padding: 20px;
            width: 100%;
        }
        table {
            width: 100%;
            border-collapse: collapse; /* Elimina el espacio entre los bordes */
        }
        th, td {
            border: 1px solid #ccc; /* Agrega bordes a cada celda */
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body class="bg-bg-project font-poppins">

    <nav class="bg-white h-screen rounded-r-xl">
        <!-- Menú de navegación -->
        <ul class="px-12">
            <li href="#" class="link-parent">
                <div class="flex gap-3 py-4 items-center">
                    <img src="../img/veterinaria.jpeg" alt="Logo de Grupo Cocei" width="50" height="50">
                    <span>Alfa veterinaria</span>
                </div>
            </li>

            <li class="link-parent">
                <a class="flex gap-3 py-4" href="../menu_prin.php">
                    <img src="../img/pagina-de-inicio.png" alt="" height="10PX" width="22PX">
                    Inicio    
                </a>
            </li>

            <li class="link-parent data-[toggle]:grid-rows-[max-content_1fr]" data-dropdown>
                <a class="flex gap-3 py-4" data-info="dropdown"  href="Dueños.php">
                <img src="../img/dueños.png" alt="" height="10PX" width="27PX">
                    Dueños
                </a>
                
            </li>

            <li class= "link-parent" >
                <a class= "flex gap-3 py-4"  href="Pacientes.php">
                <span class="insumos-icon"><img src="../img/pacientes.png" alt="" height="30PX" width="92PX"></span>
                    Pacientes
                </a>
            </li>

            <li class="link-parent">
                <a class="flex gap-3 py-4" href="Administradores.php">
                <img src="../imG/administradores.png" alt="" height="10PX" width="22PX">
                    Administradores
                </a>
            </li>


            <li class="link-parent">
                <a class="flex gap-3 py-4" href="Medicos.php">
                <img src="../imG/medicos.png" alt="" height="10PX" width="22PX">
                    Medicos
                </a>
            </li>
            

            <li class="link-parent">
                <a class="flex gap-3 py-4" href="reportes/informes.php">
                <img src="../img/diagnosticos.png" alt=""height="10PX" width="22PX">
                    Diagnostico
                </a>
            </li>

            <li class="link-parent">
                <a class="flex gap-3 py-4" href="reportes_receta/informes_receta.php">
                <img src="../img/Recetas.png" alt=""height="10PX" width="22PX">
                    Receta
                </a>
            </li>

            <li class="link-parent">
                <a class="flex gap-3 py-4" href="../../salir.php">
                    <img src="../img/cerrar-sesion.png" alt="" height="10PX" width="22PX">
                    Cerrar Sesión
                </a>
            </li>

            
    
        </ul>
    </nav>
    




    <div class="content">
        <div class="content" style="display: flex; align-items: center; justify-content: space-between;">
            <h1>PACIENTES</h1>
            <!-- Botón para abrir ventana modal -->
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#agregar-pacientes">Agregar</button>
        </div>

        <!-- Formulario de búsqueda -->
        <form method="POST" class="mb-4">
            <div class="input-group">
                <input type="text" name="busqueda" class="form-control" placeholder="Buscar por alias" value="<?php echo $busqueda; ?>" oninput="actualizarTabla()">
                <button class="btn btn-primary" type="submit" name="buscar">Buscar</button>
            </div>
        </form>

        <!-- Tabla de pacientes -->
        <table class="table table-bordered" id="dataTable">
            <thead>
                <tr>
                    <th>ID Dueño</th>
                    <th>Nombre dueño</th>
                    <th>Apellido dueño</th>
                    <th>ID Mascota</th>
                    <th>Alias</th>
                    <th>Especie</th>
                    <th>Raza</th>
                    <th>Color</th>
                    <th>Nacimiento</th>
                    <th>Peso medio</th>
                    <th>Peso actual</th>
                    <th>Editar</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Modificación de la consulta con filtro de búsqueda
                if (empty($busqueda)) {
                    // Si no hay búsqueda, mostrar todos los registros
                    $consulta = mysqli_query($conexion, "
                        SELECT dueños.id_dueño, dueños.Nombre, dueños.Apellido_p, pacientes.P_codigo, pacientes.Alias, pacientes.Especie, pacientes.Raza, pacientes.Color, pacientes.Fecha_Nac, pacientes.Peso_medio, pacientes.Peso_actual
                        FROM pacientes
                        INNER JOIN dueños ON pacientes.id_dueño = dueños.id_dueño
                    ");
                } else {
                    // Si hay búsqueda, aplicar filtro
                    $consulta = mysqli_query($conexion, "
                        SELECT dueños.id_dueño, dueños.Nombre, dueños.Apellido_p, pacientes.P_codigo, pacientes.Alias, pacientes.Especie, pacientes.Raza, pacientes.Color, pacientes.Fecha_Nac, pacientes.Peso_medio, pacientes.Peso_actual
                        FROM pacientes
                        INNER JOIN dueños ON pacientes.id_dueño = dueños.id_dueño
                        WHERE pacientes.Alias LIKE '%$busqueda%'
                    ");
                }

                while ($fila = mysqli_fetch_assoc($consulta)):
                ?>
                <tr>
                    <td><?php echo $fila['id_dueño']; ?></td>
                    <td><?php echo $fila['Nombre']; ?></td>
                    <td><?php echo $fila['Apellido_p']; ?></td>
                    <td><?php echo $fila['P_codigo']; ?></td>
                    <td><?php echo $fila['Alias']; ?></td>
                    <td><?php echo $fila['Especie']; ?></td>
                    <td><?php echo $fila['Raza']; ?></td>
                    <td><?php echo $fila['Color']; ?></td>
                    <td><?php echo $fila['Fecha_Nac']; ?></td>
                    <td><?php echo $fila['Peso_medio']; ?></td>
                    <td><?php echo $fila['Peso_actual']; ?></td>
                    <td>
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#editar-pacientes<?php echo $fila['P_codigo']; ?>">
                            <i class="fa fa-edit"></i>
                        </button>
                    </td>
                    <?php include "Funciones/editar-p.php"; ?>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>

    <?php include "Funciones/agregar-pacientes.php"; ?>

    <script>
        function actualizarTabla() {
            var busqueda = document.querySelector('input[name="busqueda"]').value;
            if (busqueda === "") {
                // Si el campo está vacío, enviar el formulario automáticamente para mostrar todos los registros
                document.forms[0].submit();
            }
        }
    </script>
</body>
</html>