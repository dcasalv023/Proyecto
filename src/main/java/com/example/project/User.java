package com.example.project;
import java.sql.SQLException;
import java.util.ArrayList;

public class User {
    public static ArrayList<User> newUsers;
    static {

        try {HelloServlet.cargaArrayListTablaUsuario();}
        catch (SQLException e) {throw new RuntimeException(e);}
        catch (ClassNotFoundException e) {throw new RuntimeException(e);}
    }


//ATRIBUTOS/////////////////////////////////////////////////////////////////////////////////////////////////////////
    private int idUsuario, edad;
    private String nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, fechaCreacion;





//CONSTRUCTOR///////////////////////////////////////////////////////////////////////////////////////////////////////
    public User(int idUsuario, String nameUsuario, String email, String contrasena, String categoria, String habilidad, String imagen, String nombre, String apellido, String telefono, int edad, String fechaCreacion) {
        this.idUsuario = idUsuario;
        this.nameUsuario = nameUsuario;
        this.email = email;
        this.contrasena = contrasena;
        this.categoria = categoria;
      //this.habilidad
            if (categoria.equals("Contribuyente")) { this.habilidad = habilidad;}
            else { this.habilidad = null;}
        this.imagen = imagen;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.edad = edad;
        this.fechaCreacion = fechaCreacion;
    }





//MÉTODOS//////////////////////////////////////////////////////////////////////////////////////////
  //Operaciones CRUD:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    /**
     * Autogenera el Id del nuevo Usuario, incorpora el usuario a la base de datos y a el ArrayList
     * @author Daniel
     * @param (nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad)
     */
    public static void createUser(String nameUsuario, String email, String contrasena, String categoria, String habilidad, String imagen, String nombre, String apellido, String telefono, int edad) throws SQLException, ClassNotFoundException {
        //1ºSe encarga de generar un Id, el cual ni se repita, ni se salte número alguno
        int generateIdUsuario = 1;
        boolean idUnique = false;
        while (!idUnique) {
            idUnique = true;
            for(User u : newUsers) {
                if (generateIdUsuario == u.idUsuario) { generateIdUsuario += 1; idUnique = false;}
            }
        }
        //2ºRecoje la fecha del sistema en la variable
        String fechaCreacion = HelloServlet.getDate();
        //3ºCon la función "insertIntoUsuarioValues" se guardan los parámetros dados y el Id autogenerado, en la tabla usuario de la base de datos
        HelloServlet.insertIntoUsuarioValues(generateIdUsuario, nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad, fechaCreacion);
        //4ºCrea un objeto User con los datos y los añade al ArrayList "newUsers"
        User e = new User(generateIdUsuario, nameUsuario, email, contrasena, categoria, habilidad, imagen, nombre, apellido, telefono, edad, fechaCreacion);
        newUsers.add(e);
    }

    public static User readIdUser(int id) {
        for (User u : newUsers) {
            if (u.getIdUsuario() == id) {
                return u;
            }
        }
        return null;
    }
    public static User readNameUser(String nameUsuario) {
        for (User u : newUsers) {
            if (u.getNameUsuario().equals(nameUsuario)) {
                return u;
            }
        }
        return null;
    }

    public void updateIdUser(int id, String newName) {
        for (User u : newUsers) {
            if (id == u.getIdUsuario()) {
                u.setNameUsuario(newName);
            }
        }
    }
    public void updateNameUser(String name, String newName) {
        for (User u : newUsers) {
            if (u.getNameUsuario().equals(name)) {
                u.setNameUsuario(newName);
            }
        }
    }

    public void deleteIdUser(int idUsuario) {
        for (User u : newUsers) {
            if (idUsuario == u.getIdUsuario()) {
                newUsers.remove(u);
            }
        }
    }



  //Getter____________________________________________________________________________________________________________
    public static ArrayList<User> getNewUsers() {return newUsers;}
    public int getIdUsuario() {return idUsuario;}
    public int getEdad() {return edad;}
    public String getNameUsuario() {return nameUsuario;}
    public String getEmail() {return email;}
    public String getContrasena() {return contrasena;}
    public String getCategoria() {return categoria;}
    public String getHabilidad() {return habilidad;}
    public String getImagen() {return imagen;}
    public String getNombre() {return nombre;}
    public String getApellido() {return apellido;}
    public String getTelefono() {return telefono;}
    public String getFechaCreacion() {return fechaCreacion;}

  //Setter____________________________________________________________________________________________________________
    public static void setNewUsers(ArrayList<User> newUsers) {User.newUsers = newUsers;}
    public void setIdUsuario(int idUsuario) {this.idUsuario = idUsuario;}
    public void setEdad(int edad) {this.edad = edad;}
    public void setNameUsuario(String nameUsuario) {this.nameUsuario = nameUsuario;}
    public void setEmail(String email) {this.email = email;}
    public void setContrasena(String contrasena) {this.contrasena = contrasena;}
    public void setCategoria(String categoria) {this.categoria = categoria;}
    public void setHabilidad(String habilidad) {this.habilidad = habilidad;}
    public void setImagen(String imagen) {this.imagen = imagen;}
    public void setNombre(String nombre) {this.nombre = nombre;}
    public void setApellido(String apellido) {this.apellido = apellido;}
    public void setTelefono(String telefono) {this.telefono = telefono;}
    public void setFechaCreacion(String fechaCreacion) {this.fechaCreacion = fechaCreacion;}



  //toString:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public String toString() {return "Id: " + this.getIdUsuario() + "<br>"
                                   + "UserName: " + this.getNameUsuario() + "<br>"
                                   + "Fecha de creación: " + this.getFechaCreacion();}
}
