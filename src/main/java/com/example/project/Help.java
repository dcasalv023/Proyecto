package com.example.project;
import java.sql.SQLException;
import java.util.ArrayList;

public class Help {
    public static ArrayList<Help> newHelps;
    static {
        try {HelloServlet.cargaArrayListTablaAyuda();}
        catch (SQLException e) {throw new RuntimeException(e);}
        catch (ClassNotFoundException e) {throw new RuntimeException(e);}
    }


//ATRIBUTOS/////////////////////////////////////////////////////////////////////////////////////////////////////////
    private int idAyuda, idSolicitante, idContribuyente;
    private String titulo, descripcion, fecha, estado;





//CONSTRUCTOR///////////////////////////////////////////////////////////////////////////////////////////////////////
    public Help(int idAyuda, String titulo, String descripcion, String fecha, String estado, int idSolicitante, int idContribuyente ) {
        this.idAyuda = idAyuda;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.estado = estado;
        this.idSolicitante = idSolicitante;
        this.idContribuyente = idContribuyente;
    }





//MÉTODOS///////////////////////////////////////////////eater egg: JAJA Saludos///////////////////////////////////////////
  //Operaciones CRUD:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    /**
     * Autogenera el Id de la nueva Ayuda, incorpora la ayuda a la base de datos y a el ArrayList
     * @author Daniel
     * @param ()
     */
    public static int createHelp(int idSolicitante, String titulo, String descripcion) throws SQLException, ClassNotFoundException {
        //1ºSe encarga de generar un Id, el cual ni se repita, ni se salte número alguno
        int generateIdAyuda = 1;
        boolean idUnique = false;
        while (!idUnique) {
            idUnique = true;
            for(Help h : newHelps) {
                if (generateIdAyuda == h.idAyuda) { generateIdAyuda += 1; idUnique = false;}
            }
        }
        //2ºRecoje la fecha del sistema en la variable
        String fechaCreacion = HelloServlet.getDate();
        //3ºvariable con estado como predeterminado
        String estado = "Pendiente de contribuyente";
        //4ºvariable idContribuyente como predeterminado
        int idContribuyente = 0;
        //4ºCon la función "insertIntoUsuarioValues" se guardan los parámetros dados y el Id autogenerado, en la tabla usuario de la base de datos
        HelloServlet.insertIntoAyudaValues(generateIdAyuda, titulo, descripcion, fechaCreacion, estado, idSolicitante, idContribuyente);
        //5ºCrea un objeto User con los datos y los añade al ArrayList "newUsers"
        Help h = new Help(generateIdAyuda, titulo, descripcion, fechaCreacion, estado, idSolicitante, idContribuyente);
        newHelps.add(h);

        return generateIdAyuda;
    }

    public static Help read(int id) {
        for (Help h : newHelps) {
            if (h.getIdAyuda() == id) {
                return h;
            }
        }
        return null;
    }



  //Getter____________________________________________________________________________________________________________
    public static ArrayList<Help> getNewHelp() { return newHelps; }
    public int getIdAyuda() {return idAyuda; }
    public String getTitulo() { return titulo; }
    public String getDescripcion() {return descripcion;}
    public String getFecha() {return fecha;}
    public String getEstado() {return estado;}
    public int getIdSolicitante() { return idSolicitante; }
    public int getIdContribuyente() { return idContribuyente; }

  //Setter____________________________________________________________________________________________________________
    public static void setNewHelp(ArrayList<Help> newHelp) { Help.newHelps = newHelp; }
    public void setIdAyuda(int id) {this.idAyuda = id;}
    public void setTitulo(String titulo) {this.titulo = titulo;}
    public void setDescripcion(String descripcion) {this.descripcion = descripcion;}
    public void setFecha(String fecha) {this.fecha = fecha;}
    public void setEstado(String estado) {this.estado = estado;}
    public void setIdSolicitante(int idSolicitante) {this.idSolicitante = idSolicitante;}
    public void setIdContribuyentee(int idContribuyente) {this.idContribuyente = idContribuyente;}



    //toString:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public String toString() {return "Id: " + this.getIdAyuda() + "<br>"
                                   + "IdSolicitante: " + this.getIdSolicitante() + "<br>"
                                   + "Idcontribuyente: " + this.getIdContribuyente() + "<br>"
                                   + "Título: " + this.getTitulo() + "<br>"
                                   + "Descripción: " + this.getDescripcion() + "<br>"
                                   + "Fecha: " + this.getFecha() + "<br>"
                                   + "Estado: " + this.getEstado();
    }

}

