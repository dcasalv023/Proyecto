package com.example.project;
import java.sql.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;




@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {


//GETFECHA==============================================================================================================
    /** Coge la fecha del sistema actual
     * @author D4nielGR
     * @return String
     */
    public static String getDate(){
        Date date = new Date();
        String sDate = "2023 " + String.valueOf(date).substring(4,16);

        return sDate;
    }





//======================================================================================================================
//==========================================CONEXIÓN A BASE DE DATOS====================================================
//======================================================================================================================
    /** Cogemos la conexión con la base de datos, interaccionando con el sistema operativo y el usuario
     *  se nos proporciona la ruta para establecer la conexión con la base de datos
     * @author D4nielGR
     * @return Connection
     */
    public static Connection getUrlConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.sqlite.JDBC");
        Connection c;

        //DanielGuerrero(casa)
        if (System.getProperty("os.name").equals("Windows 10") && System.getProperty("user.name").equals("daniel14__gr"))
        { return c = DriverManager.getConnection("jdbc:sqlite:E:/DAW/DAW 22-23/PRO/#Project/BaseDatos_Project"); }

        //DanielGuerrero(cole)
        else if (System.getProperty("os.name").equals("Linux") && System.getProperty("user.name").equals("Daniel"))
        { return c = DriverManager.getConnection("jdbc:sqlite:/media/Daniel/14GR/DAW/DAW 22-23/PRO/#Project/BaseDatos_Project"); }

        //DanielCastillejo(casa)
        else if (System.getProperty("os.name").equals("Windows 11") && System.getProperty("user.name").equals("Daniel"))
        { return c = DriverManager.getConnection("jdbc:sqlite:D:/ProyectoProg/BaseDatos Project"); }

        //DanielCastillejo(cole)
        else if (System.getProperty("os.name").equals("Windows 10") && System.getProperty("user.name").equals("Daniel"))
        { return c = DriverManager.getConnection("jdbc:sqlite:D:/ProyectoProg/BaseDatos Project"); }

        //ERROR
        else { return c = DriverManager.getConnection(""); }
    }



//======================================================================================================================
//===========================================CARGA ARRAY LIST===========================================================
//======================================================================================================================
    /** Carga los datos de la tabla Usuario de la base de datos en un Arraylist de objetos
     * @author D4nielGR
     */
    public static void cargaArrayListTablaUsuario() throws SQLException, ClassNotFoundException {
        ArrayList<User> listUsers = new ArrayList<>();

        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        ResultSet re = s.executeQuery ("SELECT * FROM Usuario");

        while (re.next()) {
            int idUsuario = Integer.parseInt(re.getString("IDUsuario"));
            String nameUsuario = re.getString("NameUsuario");
            String email = re.getString("Email");
            String contrasena = re.getString("Contrasena");
            String categoria = re.getString("Categoria");
            String habilidad = re.getString("Habilidad");
            String imagen = re.getString("Imagen");
            String nombre = re.getString("Nombre");
            String apellido = re.getString("Apellido");
            String telefono = re.getString("Telefono");
            int edad = Integer.parseInt(re.getString("Edad"));
            String fechaCreacion = re.getString("FechaCreacion");

            User u = new User(idUsuario, nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad, fechaCreacion);
            listUsers.add(u);
        }
        User.setNewUsers(listUsers);
        conexion.close();
    }

    /** Carga los datos de la tabla Ayuda de la base de datos en un Arraylist de objetos
     * @author D4nielGR
     */
    public static void cargaArrayListTablaAyuda() throws SQLException, ClassNotFoundException {
        ArrayList<Help> listHelps = new ArrayList<>();

        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        ResultSet re = s.executeQuery ("SELECT * FROM Ayuda");

        while (re.next()) {
            int idAyuda = Integer.parseInt(re.getString("IDAyuda"));
            String titulo = re.getString("Titulo");
            String description = re.getString("Descripcion");
            String fecha = re.getString("Fecha");
            String estado = re.getString("Estado");
            int idSolicitante = Integer.parseInt(re.getString("IdSolicitante"));
            int idContribuyente = Integer.parseInt(re.getString("IdContribuyente"));

            Help h = new Help(idAyuda, titulo, description, fecha, estado, idSolicitante, idContribuyente);
            listHelps.add(h);
        }
        Help.setNewHelp(listHelps);
        conexion.close();
    }



//======================================================================================================================
//==========================================INSERT INTO VALUES==========================================================
//======================================================================================================================
    /** Inserta valores de un usuario en la tabla Usuario de la base de datos
     * @author D4nielGR
     * @param idUsuario, nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad, fechaCreacion
     */
    public static void insertIntoUsuarioValues(int idUsuario, String nameUsuario, String email, String contrasena,
                                               String categoria, String habilidad, String imagen, String nombre,
                                               String apellido, String telefono, int edad, String fechaCreacion)
            throws SQLException, ClassNotFoundException {
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.execute("INSERT INTO Usuario VALUES ("
                + idUsuario
                + ", '" + nameUsuario
                + "', '" + email
                + "', '" + contrasena
                + "', '" + categoria
                + "', '" + habilidad
                + "', '" + imagen
                + "', '" + nombre
                + "', '" + apellido
                + "', '" + telefono
                + "', " + edad
                + ", '" + fechaCreacion + "')");
        conexion.close();
    }

    /** Inserta valores de una ayuda en la tabla Ayuda de la base de datos
     * @author D4nielGR
     * @param idAyuda, titulo, description, fecha, estado, idSolicitante, idContribuyente
     */
    public static void insertIntoAyudaValues(int idAyuda, String titulo, String description, String fecha,
                                             String estado, int idSolicitante, int idContribuyente)
            throws SQLException, ClassNotFoundException {
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.execute("INSERT INTO Ayuda VALUES ("
                + idAyuda
                + ", '" + titulo
                + "', '" + description
                + "', '" + fecha
                + "', '" + estado
                + "', " + idSolicitante
                + ", " + idContribuyente + ")");
        conexion.close();
    }



//======================================================================================================================
//==============================================TAKE OBJECT=============================================================
//======================================================================================================================
    /** Coge un usuario acorde al takeNameUsuario y takeContrasena introducidos, si no se encuentra en la base de datos se devolverá null
     * @author D4nielGR
     * @param takeNameUsuario, takeContrasena
     * @return User || null
     */
    public static User takeUserPassword(String takeNameUsuario, String takeContrasena)
            throws SQLException, ClassNotFoundException {
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        ResultSet listado = s.executeQuery ("SELECT * FROM Usuario");
        while (listado.next()) {
            if(listado.getString("NameUsuario").equals(takeNameUsuario) && listado.getString("Contrasena").equals(takeContrasena)) {
                int idUsuario = Integer.parseInt(listado.getString("IDUsuario"));
                String nameUsuario = listado.getString("NameUsuario");
                String email = listado.getString("Email");
                String contrasena = listado.getString("Contrasena");
                String categoria = listado.getString("Categoria");
                String habilidad = listado.getString("Habilidad");
                String imagen = listado.getString("Imagen");
                String nombre = listado.getString("Nombre");
                String apellido = listado.getString("Apellido");
                String telefono = listado.getString("Telefono");
                int edad = Integer.parseInt(listado.getString("Edad"));
                String fechaCreacion = listado.getString("FechaCreacion");

                User u = new User(idUsuario, nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad, fechaCreacion);

                conexion.close();
                return u;
            }
        }
        conexion.close();
        return null;
    }

    /** Coge un usuario acorde al takeIdUsuario introducido, si no se encuentra en la base de datos se devolverá null
     * @author D4nielGR
     * @param takeIdUsuario
     * @return User || null
     */
    public static User takeUserId(int takeIdUsuario)
            throws SQLException, ClassNotFoundException {
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        ResultSet listado = s.executeQuery ("SELECT * FROM Usuario");
        while (listado.next()) {
            if(Integer.parseInt(listado.getString("IDUsuario")) == takeIdUsuario) {
                int idUsuario = Integer.parseInt(listado.getString("IDUsuario"));
                String nameUsuario = listado.getString("NameUsuario");
                String email = listado.getString("Email");
                String contrasena = listado.getString("Contrasena");
                String categoria = listado.getString("Categoria");
                String habilidad = listado.getString("Habilidad");
                String imagen = listado.getString("Imagen");
                String nombre = listado.getString("Nombre");
                String apellido = listado.getString("Apellido");
                String telefono = listado.getString("Telefono");
                int edad = Integer.parseInt(listado.getString("Edad"));
                String fechaCreacion = listado.getString("FechaCreacion");

                User u = new User(idUsuario, nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad, fechaCreacion);

                conexion.close();
                return u;
            }
        }
        conexion.close();
        return null;
    }

    /** Coge una ayuda acorde al takeIdAyuda introducido, si no se encuentra en la base de datos se devolverá null
     * @author D4nielGR
     * @param takeIdAyuda
     * @return User || null
     */
    public static Help takeAyudaId(int takeIdAyuda)
            throws SQLException, ClassNotFoundException {
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        ResultSet listado = s.executeQuery ("SELECT * FROM Ayuda");
        while (listado.next()) {
            if(Integer.parseInt(listado.getString("IDAyuda")) == takeIdAyuda) {
                int idAyuda = Integer.parseInt(listado.getString("IDAyuda"));
                String titulo = listado.getString("Titulo");
                String descripcion = listado.getString("Descripcion");
                String fecha = listado.getString("Fecha");
                String estado = listado.getString("Estado");
                int idSolicitante = Integer.parseInt(listado.getString("IdSolicitante"));
                int idContribuyente = Integer.parseInt(listado.getString("IdContribuyente"));

                Help h = new Help(idAyuda, titulo, descripcion, fecha, estado, idSolicitante, idContribuyente);

                conexion.close();
                return h;
            }
        }
        conexion.close();
        return null;
    }



//======================================================================================================================
//=============================================CAMBIA DATOS=============================================================
//======================================================================================================================
    /** Actualiza los datos de un usuario, acorde a su id
     * @param (idUsuario, nameUsuario, email, contrasena, habilidad, imagen, nombre, apellido, telefono, edad)
     */
    public static void modificaUsuario(int idUsuario, String nameUsuario, String email, String contrasena,
                                       String habilidad, String imagen, String nombre,
                                       String apellido, String telefono, int edad)
            throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.executeUpdate("UPDATE Usuario " +
                            "SET NameUsuario = '" + nameUsuario + "', " +
                            "          Email = '" + email       + "', " +
                            "     Contrasena = '" + contrasena  + "', " +
                            "      Habilidad = '" + habilidad   + "', " +
                            "         Imagen = '" + imagen      + "', " +
                            "         Nombre = '" + nombre      + "', " +
                            "       Apellido = '" + apellido    + "', " +
                            "       Telefono = '" + telefono    + "', " +
                            "           Edad = "  + edad +
                            " WHERE IDUsuario = "  + idUsuario);
        conexion.close();

        //Actualiza el atributo arraylist de User
        HelloServlet.cargaArrayListTablaUsuario();
    }

    /** Actualiza los datos de una ayuda, acorde a su id
     * @param (idAyuda)
     */
    public static void modificaAyuda(int idAyuda, String titulo, String descripcion)
            throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.executeUpdate("UPDATE Ayuda " +
                            "SET Titulo = '" + titulo + "', " +
                            "Descripcion = '" + descripcion +
                            "' WHERE IDAyuda = "  + idAyuda);
        conexion.close();

        //Actualiza el atributo arraylist de Help
        HelloServlet.cargaArrayListTablaAyuda();
    }

    /** Actualiza el estado y el IdContribuyente de la ayuda, acorde al idAyuda
     * @param idAyuda , idcontribuyente
     */
    public static void estadoAyuda(int idAyuda, int idContribuyente) throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.execute("UPDATE Ayuda " +
                       "SET Estado = 'En ayuda', "+"IdContribuyente = " + idContribuyente +
                       " WHERE IDAyuda = " + idAyuda);
        conexion.close();

        //Actualiza el atributo arraylist de Help
        HelloServlet.cargaArrayListTablaAyuda();
    }

    /** Actualiza el email del usuario, acorde a su idUsuario
     * @param idUsuario , email
     */
    public static User cambioEmail(int idUsuario, String email) throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.executeUpdate("UPDATE Usuario " +
                             "SET Email = '" + email +
                             "' WHERE IDUsuario = " + idUsuario);
        conexion.close();

        //Actualiza el atributo arraylist de User
        HelloServlet.cargaArrayListTablaUsuario();

        for (User u: User.getNewUsers()) {
            if (u.getIdUsuario() == idUsuario) {
                return u;
            }
        }
        return null;
    }

    /** Actualiza el telefono del usuario, acorde a su idUsuario
     * @param idUsuario , telefono
     */
    public static User cambioTelefono(int idUsuario, String telefono) throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.execute("UPDATE Usuario " +
                       "SET Telefono = '" + telefono +
                       "' WHERE IDUsuario = " + idUsuario);
        conexion.close();

        //Actualiza el atributo arraylist de User
        HelloServlet.cargaArrayListTablaUsuario();

        for (User u: User.getNewUsers()) {
            if (u.getIdUsuario() == idUsuario) {
                return u;
            }
        }
        return null;
    }



//======================================================================================================================
//=============================================BORRA DATOS==============================================================
//======================================================================================================================
    /** Borra el usuario, acorde al idUsuario
     * @param idUsuario
     */
    public static void borraUsuario(int idUsuario) throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.execute("DELETE FROM Usuario WHERE IDUsuario = " + idUsuario);
        conexion.close();

        //Actualiza el atributo arraylist de User
        HelloServlet.cargaArrayListTablaUsuario();
    }

    /** Borra la ayuda, acorde al idAyuda
     * @param idAyuda
     */
    public static void borraAyuda(int idAyuda) throws SQLException, ClassNotFoundException {
        //Actualiza la base de datos
        Connection conexion = HelloServlet.getUrlConnection();
        Statement s = conexion.createStatement();
        s.execute("DELETE FROM Ayuda WHERE IDAyuda = " + idAyuda);
        conexion.close();

        //Actualiza el atributo arraylist de Help
        HelloServlet.cargaArrayListTablaAyuda();
    }
}