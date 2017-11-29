/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BackEnd;

import java.sql.SQLException;

/**
 *
 * @author lok
 */
public class SQLExceptionCheck {
    public static boolean isAuthenticationError(SQLException e) {
        return e.getSQLState().startsWith("28");
    }
}
