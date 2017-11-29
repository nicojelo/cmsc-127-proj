/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd;
import FrontEnd.*;
import java.sql.*;
        

/**
 *
 * @author lok
 */
public class MariaDB {
    Connection connection;
    Statement statement;
    ResultSet result;
    FrontFrame frontFrame;
    
    public MariaDB(String username, String password, FrontFrame frontFrame) throws SQLException{
        this.connection = null;
        this.statement = null;
        this.result = null;
        this.frontFrame = frontFrame;
        
        try{
            this.connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/uaap", username, password);
            //connection succesful
            this.frontFrame.dispose();
            new MainFrame().setVisible(true);
            //this.statement = connection.createStatement();
            //this.result = statement.executeQuery("select * from member;");
            
            //while(result.next()){
            //    System.out.println(result.getString("memberfullname") + " - " + result.getString("membername"));
            //}
        }
        catch(Exception e) {
            throw e;
        }
        finally{
            //close SQL
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
