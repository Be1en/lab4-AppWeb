/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelos;

import java.sql.*;
import java.util.*;

public class cBaseDatos {
    String driver  = "com.mysql.cj.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String clave   = "123456";

    private Connection Conectar() {
        try {
            Class.forName(driver);
            Connection xcon = DriverManager.getConnection(url,usuario,clave);
            return xcon;
        }
        catch(Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }
    public boolean validarUsuario(String xnom, String xcla) {
        try {
            Connection xcon = this.Conectar();
            String sql = "select count(*) from t_usuarios where nombre=? AND clave=?";
            PreparedStatement ps=xcon.prepareStatement(sql);
            ps.setString(1, xnom );
            ps.setString(2, xcla );
            ResultSet rs = ps.executeQuery();
 	     rs.next();
            String cantidad = rs.getString(1);
            int xcant = Integer.parseInt( cantidad );
            if ( xcant > 0 )
                return true;
            xcon.close();
            return false;
        } catch (Exception ex ) {
            System.out.println(ex.toString());
        }
        return false;
    }
    public String obtenerEstadoUsuario(String xnom) {
    String estadoUsuario = ""; // Inicialmente vacío
    try {
        Connection xcon = this.Conectar();
        String sql = "SELECT estado FROM t_usuarios WHERE nombre=?";
        PreparedStatement ps = xcon.prepareStatement(sql);
        ps.setString(1, xnom);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            estadoUsuario = rs.getString("estado");
        }
        
        // Cierra la conexión
        xcon.close();
        
        return estadoUsuario; // Devuelve el estado del usuario si se encuentra
    } catch (Exception ex ) {
        System.out.println(ex.toString());
    }
    return estadoUsuario; // Devuelve un estado vacío si hay una excepción o no se encuentra el usuario
}

}

