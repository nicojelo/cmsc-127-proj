/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FrontEnd;

import java.sql.SQLException;
/**
 *
 * @author lok
 */
public class Main {
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        //FrontFrame window = new FrontFrame();
        //window.setVisible(true);
        java.awt.EventQueue.invokeLater(new Runnable() {
        public void run() {
                new FrontFrame().setVisible(true);
            }
        });        
    }
    
    
}
