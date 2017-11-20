/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd;
import java.sql.*;
        

/**
 *
 * @author lok
 */
public class MariaDB {
    Connection connection;
    Statement statement;
    ResultSet result;
    
    public MariaDB(String username, String password) throws SQLException{
        this.connection = null;
        this.statement = null;
        this.result = null;
        
        try{
            this.connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/customerhistory", username, password);
            this.statement = connection.createStatement();
            this.result = statement.executeQuery("select * from transaction;");
            
            while(result.next()){
                System.out.println(result.getString("activity"));
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finally{
            if (this.result != null){
                this.result.close();
            }
            if(this.statement != null){
                this.statement.close();
            }
            
            if(this.connection != null){
                this.connection.close();
            }
        }
        
    }
}
